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
     * Gene
     *
     * @param username
     * @param password
     * @return
     */
    public String getLoginSalt(String username, String password) {
        return Encryption.generateSalt(username, password);
    }

    /**
     * Generate a secret key from a password and salt
     *
     * @param password Password to generate
     * @param salt Salt to generate
     * @return SecretKey object used in encryption
     * @throws Exception When Key can't be generated, possibly because of wrong
     * input
     */
    private SecretKey getSecretKey(String password, String salt) throws Exception {
        return Encryption.getSecretKey(password, salt);
    }

    /**
     * Encrypt password using username and password.
     *
     * @param username Username to pair with password for encryption
     * @param password Password to pair with username for encryption
     * @return Hash of password
     * @throws Exception
     */
    public String encryptPassword(String password, String salt) throws Exception {
        return Encryption.encrypt(password, getSecretKey(password, salt));
    }

    public boolean verifyLogin(String enteredPassword, String passwordHash, String passwordSalt) throws Exception {
        return encryptPassword(enteredPassword, passwordSalt).equals(passwordHash);
    }
    

}
