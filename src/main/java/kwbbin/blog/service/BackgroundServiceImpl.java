package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Message;
import kwbbin.blog.bean.Section;
import kwbbin.blog.bean.Zone;
import kwbbin.blog.dao.IBackgroundDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BackgroundServiceImpl implements IBackgroundService{

    @Autowired
    IBackgroundDao dao;

    public void setDao(IBackgroundDao dao) {
        this.dao = dao;
    }

    public List<Article> getAllArticle() {
        return dao.getAllArticle();
    }

    public List<Section> getAllSection() {
        return dao.getAllSection();
    }

    public Section getSingleSection(Integer id){
        return dao.getSingleSection(id);
    };

    public List<Zone> getSectionZone(){
        return dao.getSectionZone();
    }

    public void addSection(Section section){
        dao.addSection(section);
    }

    public Section getSectionByTitle(String title){
        return dao.getSectionByTitle(title);
    };

    public Section getSectionById(Integer id){
        return dao.getSectionById(id);
    };

    public void updateSection(Section section){
        dao.updateSection(section);
    }

    public void deleteSection(Integer id) {
        dao.deleteSection(id);
    }

    public List<Message> getAllMessage() {
        return dao.getAllMessage();
    }

    public Message getSingleMessage(Integer id) {
        return dao.getSingleMessage(id);
    }

    public void deleteMessage(Integer id) {
        dao.deleteMessage(id);
    }

    public void updateMessageById(Message message) {
        dao.updateMessageById(message);
    }

    ;

}
