package db.model;

import java.sql.Date;

public class Board {

    private int boardNumber;
    private String subject;
    private String content;
    private String reply;
    private String reply_;
    private String type;
    private String id;
    private Date time;
    private int count;
    private String pw;

    public Board(int boardNumber, String subject, String content, String reply, String reply_, String type, String id,
            Date time, int count, String pw) {
        super();
        this.boardNumber = boardNumber;
        this.subject = subject;
        this.content = content;
        this.reply = reply;
        this.reply_ = reply_;
        this.type = type;
        this.id = id;
        this.time = time;
        this.count = count;
        this.pw = pw;
    }

    public Board(String subject, String content, String reply, String reply_, String type, String id, Date time,
            int count, String pw) {
        super();
        this.subject = subject;
        this.content = content;
        this.reply = reply;
        this.reply_ = reply_;
        this.type = type;
        this.id = id;
        this.time = time;
        this.count = count;
        this.pw = pw;
    }

    public int getBoardNumber() {
        return boardNumber;
    }

    public void setBoardNumber(int boardNumber) {
        this.boardNumber = boardNumber;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getReply_() {
        return reply_;
    }

    public void setReply_(String reply_) {
        this.reply_ = reply_;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

}
