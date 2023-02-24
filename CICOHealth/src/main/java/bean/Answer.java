/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author User
 */
public class Answer {
    private String answerID;
    private String createBy;
    private String questionTopic;
    private String questionContent;
    private String answerContent;

    public Answer() {
    }

    public Answer(String answerID, String createBy, String questionTopic, String questionContent, String answerContent) {
        this.answerID = answerID;
        this.createBy = createBy;
        this.questionTopic = questionTopic;
        this.questionContent = questionContent;
        this.answerContent = answerContent;
    }

    public String getAnswerID() {
        return answerID;
    }

    public void setAnswerID(String answerID) {
        this.answerID = answerID;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
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

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }
    
    
    
    
    
    
}
