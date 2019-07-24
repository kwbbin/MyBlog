package kwbbin.blog.dao;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.ArticleType;
import kwbbin.blog.bean.ArticleType_;
import kwbbin.blog.bean.Friendlink;

import java.util.List;

public interface IHomePageDao {
	public List<Article> getAllArticle();
	public int getArticleSum();
	public List<ArticleType_> getAllHomePageLabel();
	public ArticleType getArticleTypeById(int id);
	public List<Article> getRentArticle();
	public List<Article> getHotArticle();
	public List<Friendlink> getFriendLink();
	public void addGood(Integer id);
	public Integer getReplyNum(Integer id);
}
