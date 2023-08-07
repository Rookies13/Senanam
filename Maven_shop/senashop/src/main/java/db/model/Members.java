package db.model;

import java.sql.Timestamp;

public class Members {
    private String id;
    private String pw;
    private String nm;
    private String mb;
    private String em;
    private String zc;
    private String ad1;
    private String ad2;
    private int userLv;
    private String termAgree;
    private Timestamp createAt;
    private int point;

    public Members(String id, String pw, String nm, String mb, String em, String zc, String ad1, String ad2,
            int userLv, String termAgree, Timestamp createAt) {
        this.id = id;
        this.pw = pw;
        this.nm = nm;
        this.mb = mb;
        this.em = em;
        this.zc = zc;
        this.ad1 = ad1;
        this.ad2 = ad2;
        this.userLv = userLv;
        this.termAgree = termAgree;
        this.createAt = createAt;
    }

    public Members(String id, String nm, String mb, String em, String zc, String ad1, String ad2,
            int userLv, String termAgree, Timestamp createAt, int point) {
        this.id = id;
        this.nm = nm;
        this.mb = mb;
        this.em = em;
        this.zc = zc;
        this.ad1 = ad1;
        this.ad2 = ad2;
        this.userLv = userLv;
        this.termAgree = termAgree;
        this.createAt = createAt;
        this.point = point;
    }

    public Members(String nm, String mb, String em, String zc, String ad1, String ad2, int userLv,
            String termAgree, Timestamp createAt, int point) {
        this.nm = nm;
        this.mb = mb;
        this.em = em;
        this.zc = zc;
        this.ad1 = ad1;
        this.ad2 = ad2;
        this.userLv = userLv;
        this.termAgree = termAgree;
        this.createAt = createAt;
        this.point = point;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getNm() {
        return nm;
    }

    public void setNm(String nm) {
        this.nm = nm;
    }

    public String getMb() {
        return mb;
    }

    public void setMb(String mb) {
        this.mb = mb;
    }

    public String getEm() {
        return em;
    }

    public void setEm(String em) {
        this.em = em;
    }

    public String getZc() {
        return zc;
    }

    public void setZc(String zc) {
        this.zc = zc;
    }

    public String getAd1() {
        return ad1;
    }

    public void setAd1(String ad1) {
        this.ad1 = ad1;
    }

    public String getAd2() {
        return ad2;
    }

    public void setAd2(String ad2) {
        this.ad2 = ad2;
    }

    public int getUserLv() {
        return userLv;
    }

    public void setUserLv(int userLv) {
        this.userLv = userLv;
    }

    public String getTermAgree() {
        return termAgree;
    }

    public void setTermAgree(String termAgree) {
        this.termAgree = termAgree;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

}
