package kwbbin.blog.service;

import kwbbin.blog.bean.Article;

import java.util.List;


public interface ILifeService {
    public List<Article> getLifeArticle(int currPage, int pageSize);
    public int getLifePageNum(double pageSize);
}
