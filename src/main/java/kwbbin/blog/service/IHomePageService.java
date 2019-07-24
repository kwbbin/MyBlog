package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Friendlink;

import java.util.List;
import java.util.Map;

public interface IHomePageService {
	public List<Article> getHomePageArticle(int currPage, int pageSize);
	public int getPageNum(double pageSize);
	public Map getAllHomePageLabel();
	public List<Article> getHomePageRecent();
	public List<Article> getHomePageHot();
	public List<Friendlink> getHomePageFriendsLink();
	public void addGood(Integer id);
	public Integer getReplyNum(Integer id);
}
