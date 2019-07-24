package kwbbin.blog.dao;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Message;
import kwbbin.blog.bean.Section;
import kwbbin.blog.bean.Zone;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IBackgroundDao {
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
    public void updateMessageById(Message message);

}
