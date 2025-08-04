/*
 * Copyright (C) 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.google.android.exoplayer2.demo;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;

/**
 * Login activity for the ExoPlayer demo app.
 */
public class LoginActivity extends AppCompatActivity {

    private static final String PREF_NAME = "LoginPrefs";
    private static final String KEY_IS_LOGGED_IN = "isLoggedIn";
    
    // Test credentials
    private static final String TEST_USERNAME = "admin";
    private static final String TEST_PASSWORD = "admin";

    private TextInputEditText usernameEdit;
    private TextInputEditText passwordEdit;
    private TextInputLayout usernameLayout;
    private TextInputLayout passwordLayout;
    private MaterialButton loginButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        // Check if user is already logged in
        if (isLoggedIn()) {
            navigateToMain();
            return;
        }

        initializeViews();
        setupListeners();
    }

    private void initializeViews() {
        usernameEdit = findViewById(R.id.username_edit);
        passwordEdit = findViewById(R.id.password_edit);
        usernameLayout = findViewById(R.id.username_layout);
        passwordLayout = findViewById(R.id.password_layout);
        loginButton = findViewById(R.id.login_button);
    }

    private void setupListeners() {
        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                performLogin();
            }
        });

        // Handle Enter key press
        passwordEdit.setOnEditorActionListener((v, actionId, event) -> {
            performLogin();
            return true;
        });
    }

    private void performLogin() {
        String username = usernameEdit.getText().toString().trim();
        String password = passwordEdit.getText().toString().trim();

        // Clear previous errors
        usernameLayout.setError(null);
        passwordLayout.setError(null);

        // Validate input
        if (TextUtils.isEmpty(username)) {
            usernameLayout.setError("Username is required");
            return;
        }

        if (TextUtils.isEmpty(password)) {
            passwordLayout.setError("Password is required");
            return;
        }

        // Check credentials
        if (validateCredentials(username, password)) {
            // Save login state
            saveLoginState(true);
            
            // Show success message
            Toast.makeText(this, R.string.login_success, Toast.LENGTH_SHORT).show();
            
            // Navigate to main activity
            navigateToMain();
        } else {
            // Show error message
            Toast.makeText(this, R.string.login_error, Toast.LENGTH_LONG).show();
            passwordLayout.setError("Invalid credentials");
        }
    }

    private boolean validateCredentials(String username, String password) {
        return TEST_USERNAME.equals(username) && TEST_PASSWORD.equals(password);
    }

    private void navigateToMain() {
        Intent intent = new Intent(this, SampleChooserActivity.class);
        startActivity(intent);
        finish(); // Close login activity
    }

    private boolean isLoggedIn() {
        SharedPreferences prefs = getSharedPreferences(PREF_NAME, MODE_PRIVATE);
        return prefs.getBoolean(KEY_IS_LOGGED_IN, false);
    }

    private void saveLoginState(boolean isLoggedIn) {
        SharedPreferences prefs = getSharedPreferences(PREF_NAME, MODE_PRIVATE);
        SharedPreferences.Editor editor = prefs.edit();
        editor.putBoolean(KEY_IS_LOGGED_IN, isLoggedIn);
        editor.apply();
    }

    public static void logout(Activity activity) {
        SharedPreferences prefs = activity.getSharedPreferences(PREF_NAME, MODE_PRIVATE);
        SharedPreferences.Editor editor = prefs.edit();
        editor.putBoolean(KEY_IS_LOGGED_IN, false);
        editor.apply();
    }
}