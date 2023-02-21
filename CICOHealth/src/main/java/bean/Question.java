/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author vhqua
 */
public class Question {

    private String questionID;
    private String submittedBy;
    private String questionTopic;
    private String questionContent;

    public Question() {
        // default constructor
    }

    public Question(String questionID, String submittedBy, String questionTopic, String questionContent) {
        this.questionID = questionID;
        this.submittedBy = submittedBy;
        this.questionTopic = questionTopic;
        this.questionContent = questionContent;
    }

    public String getQuestionID() {
        return questionID;
    }

    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    public String getSubmittedBy() {
        return submittedBy;
    }

    public void setSubmittedBy(String submittedBy) {
        this.submittedBy = submittedBy;
    }

    public String getQuestionTopic() {
        return questionTopic;
    }

    public void setQuestionTopic(String questionTopic) {
        this.questionTopic = questionTopic;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }
}
