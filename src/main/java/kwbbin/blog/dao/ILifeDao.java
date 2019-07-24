package kwbbin.blog.dao;

import kwbbin.blog.bean.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ILifeDao {
    public List<Article> getAllLifeArticle();
    public int getLifeArticleSum();
}
