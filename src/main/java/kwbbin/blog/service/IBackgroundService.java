package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Message;
import kwbbin.blog.bean.Section;
import kwbbin.blog.bean.Zone;

import java.util.List;

public interface IBackgroundService {
    public List<Article> getAllArticle();
    public List<Section> getAllSection();
    public Section getSingleSection(Integer id);
    public List<Zone> getSectionZone();
    public void addSection(Section section);
    public Section getSectionByTitle(String title);
    public Section getSectionById(Integer id);
    public void updateSection(Section section);
    public void deleteSection(Integer id);

    public List<Message> getAllMessage();
    public Message getSingleMessage(Integer id);
    public void deleteMessage(Integer id);
    public void updateMessageById(Message  message);
}
