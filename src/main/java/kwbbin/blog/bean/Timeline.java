package kwbbin.blog.bean;

import java.util.Date;

public class Timeline {
    Integer id;
    String title;
    Date time;
    String content;

    public Timeline() {
    }

    public Timeline(Integer id, String title, Date time, String content) {
        this.id = id;
        this.title = title;
        this.time = time;
        this.content = content;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String toString() {
        return "Timeline{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", time=" + time +
                ", content='" + content + '\'' +
                '}';
    }
}
