package util;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class Encryption {

    private static final String ALGO = "AES/CBC/PKCS5Padding";//Encryption Algorithm used
    private static final byte[] IV = new byte[]{(byte) 'p', (byte) 'r', (byte) 'j', (byte) '3', (byte) '0', (byte) '1',
        (byte) 'g', (byte) 'r', (byte) 'o', (byte) 'u', (byte) 'p', (byte) '4', (byte) 'f', (byte) 'a', (byte) '2', (byte) '2',};//To generate IvParameterSpec

    /**
     * Generate secret key from two string inputs
     *
     * @param input1 Input 1
     * @param input2 Input 2
     * @return A secret key object used for encryption
     * @throws NoSuchAlgorithmException exception When the algorithm for
     * generating is not found.
     * @throws InvalidKeySpecException exception When key spec is invalid
     */
    public static SecretKey getSecretKey(String input1, String input2)
            throws NoSuchAlgorithmException, InvalidKeySpecException {

        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        KeySpec spec = new PBEKeySpec(input1.toCharArray(), input2.getBytes(), 65536, 256);
        SecretKey secret = new SecretKeySpec(factory.generateSecret(spec)
                .getEncoded(), "AES");
        return secret;
    }

    /**
     * Generate IvParameterSpec from IV field
     *
     * @return IvParameterSpec IvParameterSpec
     */
    public static IvParameterSpec generateIv() {
        return new IvParameterSpec(IV);
    }

    /**
     * Encrypt an input string using a secret key
     *
     * @param input Input to be encrypted
     * @param key Key for encrypting
     * @return Encrypted String
     * @throws NoSuchPaddingException exception
     * @throws NoSuchAlgorithmException exception
     * @throws InvalidAlgorithmParameterException exception
     * @throws InvalidKeyException exception
     * @throws BadPaddingException exception
     * @throws IllegalBlockSizeException exception
     */
    public static String encrypt(String input, SecretKey key
    ) throws NoSuchPaddingException, NoSuchAlgorithmException,
            InvalidAlgorithmParameterException, InvalidKeyException,
            BadPaddingException, IllegalBlockSizeException {
        IvParameterSpec iv = generateIv();
        Cipher cipher = Cipher.getInstance(ALGO);
        cipher.init(Cipher.ENCRYPT_MODE, key, iv);
        byte[] cipherText = cipher.doFinal(input.getBytes());
        return Base64.getEncoder()
                .encodeToString(cipherText);
    }

    /**
     * Decrypt an encrypted String using a SecretKey
     *
     * @param cipherText String to be decrypted
     * @param key Key to be used
     * @return Decrypted String
     * @throws NoSuchPaddingException exception
     * @throws NoSuchAlgorithmException exception
     * @throws InvalidAlgorithmParameterException exception
     * @throws InvalidKeyException exception
     * @throws BadPaddingException exception
     * @throws IllegalBlockSizeException exception
     */
    public static String decrypt(String cipherText, SecretKey key
    ) throws NoSuchPaddingException, NoSuchAlgorithmException,
            InvalidAlgorithmParameterException, InvalidKeyException,
            BadPaddingException, IllegalBlockSizeException {
        IvParameterSpec iv = generateIv();
        Cipher cipher = Cipher.getInstance(ALGO);
        cipher.init(Cipher.DECRYPT_MODE, key, iv);
        byte[] plainText = cipher.doFinal(Base64.getDecoder()
                .decode(cipherText));
        return new String(plainText);
    }

    /**
     * Encrypt a String using Caesar Cipher
     *
     * @param text Text to be encrypted
     * @param shift Shifting value
     * @return Encrypted String
     */
    private static StringBuffer encryptCaesarCipher(String text, int shift) {
        StringBuffer result = new StringBuffer();

        for (int i = 0; i < text.length(); i++) {
            if (Character.isUpperCase(text.charAt(i))) {
                char ch = (char) (((int) text.charAt(i)
                        + shift - 65) % 26 + 65);
                result.append(ch);
            } else {
                char ch = (char) (((int) text.charAt(i)
                        + shift - 97) % 26 + 97);
                result.append(ch);
            }
        }
        return result;
    }

    /**
     * Generate a String of special characters and numbers
     *
     * @return Generated String
     */
    private static String generateSpecChar() {
        int ASCIIMin = 33;//ASCII code where special characters begin
        int ASCIIMax = 47;//ASCII code where special characters end
        String res = "";
        //Generate a length 20 string
        for (int i = 0; i < 10; i++) {
            int specChar = ((int) Math.floor(Math.random() * (ASCIIMax - ASCIIMin + 1) + ASCIIMin));
            //Number character
            int number = ((int) Math.floor(Math.random() * 10));
            res += number;
            res += (char) specChar;
        }
        //Lower bound to cut the string
        int lowerBound = ((int) Math.floor(Math.random() * (14 + 1)));
        int upperBound = lowerBound + 6;
        //Return a length 6 string
        return res.substring(lowerBound, upperBound);
    }

    /**
     * Generate salt from two strings
     *
     * @param input1 String 1
     * @param input2 String 2
     * @return Result salt
     */
    public static String generateSalt(String input1, String input2) {
        int max = 100;
        int min = 1;
        int rand = (int) Math.floor(Math.random() * (max - min + 1) + min);
        if (input1 == null || input2 == null || input1.length() + input2.length() < 10) {
            return "Unable to generate salt";
        }
        //Encrypt the 2 inputs using Caesar Cipher
        String salt = encryptCaesarCipher(input2 + input1, rand).toString();
        //Cut the string and add some digits and special characters
        salt = salt.substring(0, 6) + generateSpecChar() + salt.substring(6, 11);
        System.out.println("Salt: " + salt);
        return salt;
    }
}
