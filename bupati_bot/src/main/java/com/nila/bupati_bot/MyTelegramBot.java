package com.nila.bupati_bot;

import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class MyTelegramBot extends TelegramLongPollingBot {

    // Database Credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/db_bupati";
    private static final String DB_USER = "root"; // Ensure this is the correct database user
    private static final String DB_PASSWORD = ""; // Ensure this is the correct password

    // Telegram Bot Credentials
    private static final String BOT_TOKEN = "7374880459:AAFB2M-SJUOQN4miE4HMb47TZAIgRsViNMU";
    private static final String BOT_USERNAME = "caribupati_bot";

    @Override
    public void onUpdateReceived(Update update) {
        if (update.hasMessage() && update.getMessage().hasText()) {
            String messageText = update.getMessage().getText().trim();
            long chatId = update.getMessage().getChatId();
            String username = update.getMessage().getFrom().getUserName();

            // Save user info to user table if not already saved
            saveUserInfo(chatId, username);

            // Save the user's message to the database
            saveMessageToDatabase(String.valueOf(chatId), username, messageText, LocalDate.now());

            // Process received message
            if (messageText.startsWith("/register")) {
                // Register user process
                registerUser(chatId, username);
            } else {
                // Check if user is registered
                if (!isUserRegistered(chatId)) {
                    sendMessage(chatId, "Anda tidak terdaftar. Silakan gunakan /register untuk mendaftar terlebih dahulu.");
                    return;
                }

                // Process other commands
                if (messageText.startsWith("/cari_bupati")) {
                    // Check if the command is exactly "/cari_bupati"
                    if (messageText.equals("/cari_bupati")) {
                        sendMessage(chatId, "Untuk mencari bupati, gunakan perintah dalam format ini:\n/cari_bupati [nama_kabupaten]");
                    } else {
                        // Extract district name from message
                        String district = messageText.substring(13).trim(); // Get district name from message
                        String regent = findRegent(district);
                        sendMessage(chatId, "Nama bupati dari Kabupaten " + district + " adalah " + regent);
                    }
                } else if (messageText.startsWith("/help")) {
                    // Help message
                    sendMessage(chatId, "Available commands:\n"
                            + "/register - to register\n"
                            + "/cari_bupati [nama_kabupaten] - untuk mencari bupati berdasarkan nama kabupaten\n"
                            + "/help - untuk menampilkan bantuan");
                } else if (messageText.startsWith("/run")) {
                    // Run command intro message
                    sendMessage(chatId, "Selamat datang di Bupati Bot!😊\n"
                            + "Bot ini membantu Anda menemukan informasi nama bupati.\n"
                            + "Gunakan /register untuk mendaftar sebagai anggota.\n"
                            + "Gunakan /cari_bupati [nama_kabupaten] untuk mencari nama bupati suatu kabupaten.\n"
                            + "Gunakan /help untuk melihat semua perintah yang tersedia.");
                } else {
                    // Default response if command is not recognized
                    sendMessage(chatId, "Perintah tidak dikenali. Ketik /help untuk bantuan.");
                }
            }
        }
    }

    // Method to save user info
    private void saveUserInfo(long chatId, String username) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO user (chat_id, username) VALUES (?, ?) ON DUPLICATE KEY UPDATE username = VALUES(username)")) {
            stmt.setLong(1, chatId);
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to send response message and save it to the database
    private void sendMessage(long chatId, String message) {
        SendMessage sendMessage = new SendMessage();
        sendMessage.setChatId(String.valueOf(chatId));
        sendMessage.setText(message);
        try {
            execute(sendMessage);
            // Save the bot's response to the database
            saveMessageToDatabase(String.valueOf(chatId), BOT_USERNAME, message, LocalDate.now());
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    // Method to register user
    private void registerUser(long chatId, String username) {
        // Check if user is already registered
        if (isUserRegistered(chatId)) {
            sendMessage(chatId, "Anda sudah terdaftar!\n"
                    + "Gunakan /cari_bupati [nama_kabupaten] untuk mencari nama bupati suatu kabupaten.\n"
                    + "Gunakan /help untuk melihat semua perintah yang tersedia.\"");
            return;
        }

        // If not registered, proceed with registration
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO member (chat_id, username) VALUES (?, ?)")) {
            stmt.setLong(1, chatId);
            stmt.setString(2, username);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                sendMessage(chatId, "Registrasi berhasil!\n"
                        + "Gunakan /cari_bupati [nama_kabupaten] untuk mencari nama bupati suatu kabupaten.\n"
                    + "Gunakan /help untuk melihat semua perintah yang tersedia.\"");
            } else {
                sendMessage(chatId, "Registrasi gagal. Silakan coba lagi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            sendMessage(chatId, "Registrasi gagal. Silakan coba lagi.");
        }
    }

    // Method to check if user is registered
    private boolean isUserRegistered(long chatId) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM member WHERE chat_id = ?")) {
            stmt.setLong(1, chatId);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // Returns true if user is registered, false otherwise
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false on any error
        }
    }

    // Method to find regent by district name
    private String findRegent(String district) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
             PreparedStatement stmt = conn.prepareStatement("SELECT Bupati FROM kunci WHERE Kabupaten = ?")) {
            stmt.setString(1, district.toLowerCase());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("Bupati");
            } else {
                return "Tidak ditemukan informasi nama bupati untuk Kabupaten" + district;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Terjadi kesalahan saat mencari informasi bupati.";
        }
    }

    // Method to save message to database
    private void saveMessageToDatabase(String chatId, String username, String text, LocalDate currentDate) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO pesan (chat_id, username, pesan, date) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, chatId);
            statement.setString(2, username);
            statement.setString(3, text);
            statement.setString(4, String.valueOf(currentDate));
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    void sendBroadcastTo(String username, String broadcast) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT chat_id FROM member WHERE username=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String sChatId = resultSet.getString("chat_id");
                long chatId = Long.parseLong(sChatId);
                sendResponse(chatId, broadcast);
            }

            LocalDate currentDate = LocalDate.now();

            saveMessageToDatabase("11520043", BOT_USERNAME, broadcast, currentDate);

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void sendResponse(Long chatId, String response) {
        SendMessage message = new SendMessage();
        message.setChatId(String.valueOf(chatId)); // Fixed conversion to String
        message.setText(response);
        try {
            execute(message);
            // Save the bot's response to the database
            saveMessageToDatabase(String.valueOf(chatId), BOT_USERNAME, response, LocalDate.now());
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    void sendBroadcastAll(String broadcast) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT chat_id FROM member";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String sChatId = resultSet.getString("chat_id");
                long chatId = Long.parseLong(sChatId);
                sendResponse(chatId, broadcast);
            }

            LocalDate currentDate = LocalDate.now();

            saveMessageToDatabase("11520043", BOT_USERNAME, broadcast, currentDate);

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getBotUsername() {
        return BOT_USERNAME;
    }

    @Override
    public String getBotToken() {
        return BOT_TOKEN;
    }
}