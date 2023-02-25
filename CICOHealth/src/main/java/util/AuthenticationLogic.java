package util;

import javax.crypto.SecretKey;

/**
 * Provides logic for authentication (encrypting credentials, verifying
 * credentials)
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class AuthenticationLogic {

    /**
     * Generates a salt value for a user's login credentials.
     *
     * @param username A string representing the user's username.
     * @param password A string representing the user's password.
     * @return A string representing the salt value for the user's login
     * credentials.
     */
    public String getLoginSalt(String username, String password) {
        // Generate a salt value using the provided username and password
        return Encryption.generateSalt(username, password);
    }

    /**
     * Retrieves a secret key based on a given password and salt.
     *
     * @param password A string representing the user's password.
     * @param salt A string representing the salt value for the user's password.
     * @return A SecretKey object representing the secret key generated from the
     * password and salt values.
     * @throws Exception if there is an error generating the secret key.
     */
    private SecretKey getSecretKey(String password, String salt) throws Exception {
        // Generate a secret key using the provided password and salt
        return Encryption.getSecretKey(password, salt);
    }

    /**
     * Encrypts a password using a secret key.
     *
     * @param password A string representing the user's password.
     * @param salt Salt value used along with encrypting password
     * @return A string representing the encrypted password.
     * @throws Exception if there is an error encrypting the password.
     */
    public String encryptPassword(String password, String salt) throws Exception {
        return Encryption.encrypt(password, getSecretKey(password, salt));
    }

    /**
     * Verifies a user's login credentials.
     *
     * @param enteredPassword A string representing the password entered by the
     * user.
     * @param passwordHash A string representing the encrypted password hash
     * stored in the database.
     * @param passwordSalt A string representing the salt value used to generate
     * the password hash stored in the database.
     * @return true if the entered password matches the stored password hash,
     * false otherwise.
     * @throws Exception if there is an error verifying the login credentials.
     */
    public boolean verifyLogin(String enteredPassword, String passwordHash, String passwordSalt) throws Exception {
        // Encrypt the entered password using the stored salt value and compare it to the stored password hash
         return encryptPassword(enteredPassword, passwordSalt).equals(passwordHash);
    }

}
