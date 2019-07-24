package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.ArticleType;
import kwbbin.blog.bean.ArticleType_;
import kwbbin.blog.bean.Friendlink;
import kwbbin.blog.dao.IHomePageDao;
import kwbbin.blog.utils.GetRandom;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.*;
import java.util.Map.Entry;

@Service("HomePageService")
public class HomePageServiceImpl implements IHomePageService {
	@Resource(name="IHomePageDao")
	private IHomePageDao dao;

	public void setDao(IHomePageDao dao) {
		this.dao = dao;
	}
	
	/**
	 * 得到指定的几条文章数据
	 * */
	@Transactional
	public List<Article> getHomePageArticle(int currPage, int pageSize) {
		 List<Article> students = dao.getAllArticle();
			for(Article art:students){
				art.setReplySum(dao.getReplyNum(art.getId()));
			}
	        //从第几条数据开始
	        int firstIndex = (currPage - 1) * pageSize;
	        //到第几条数据结束
	        int lastIndex = currPage * pageSize;
	        int totalArticle=dao.getArticleSum();
	        if(lastIndex>=totalArticle){
	        	lastIndex=totalArticle;
	        }
	        return students.subList(firstIndex, lastIndex); //直接在list中截取
		
	}
	
	
	public int getPageNum(double pageSize) {
		return (int) Math.ceil(dao.getArticleSum()/pageSize);
	}
	
	
	/**
	 * 如需改变标签数量可改变utils包里的工具类
	 * GetRandom里的随机数生成个数
	 * ArticleType个数要大于随机数个数
	 * */
	public Map getAllHomePageLabel() {
		List<ArticleType_> articleType=dao.getAllHomePageLabel();
		Set<Integer> id=new HashSet<Integer>();
		Map<String, Integer> map=new TreeMap<String,Integer>();
		
		int good=0;
		for (ArticleType_ ar : articleType) {
			if(id.add(ar.getArticleType())){
				good=0;
				for (ArticleType_ arr : articleType) {
					if(arr.getArticleType()==ar.getArticleType()){
						good=good+arr.getGood();
					}
				}
				map.put(ar.getArticleType()+"", good);
			}	
		}
		
		/**
		 * 对good进行排序挑出前20
		 * */
		 // 升序比较器
        Comparator<Entry<String, Integer>> valueComparator = new Comparator<Entry<String,Integer>>() {
            @Override
            public int compare(Entry<String, Integer> o1,
                    Entry<String, Integer> o2) {
                // TODO Auto-generated method stub
                return o2.getValue()-o1.getValue();
            }
        };
        // map转换成list进行排序
        List<Entry<String, Integer>> list = new ArrayList<Entry<String,Integer>>(map.entrySet());
        // 排序
        Collections.sort(list,valueComparator);

        List<ArticleType> ArticleList=new ArrayList<ArticleType>();
        Map<String, ArticleType> ArticleMap=new LinkedHashMap<>();
        List<Integer> nn=GetRandom.getNonredundantNumber();//打乱标签顺序
        for(int j=0;j<nn.size();j++){
        	int i=1;
        	for (Entry<String, Integer> entry : list) {
        		if(i==nn.get(j)&&i<=5){
        			ArticleMap.put("impotant"+i, dao.getArticleTypeById(Integer.parseInt(entry.getKey())));
        		}else if(i==nn.get(j)){
        			ArticleMap.put("noImpotant"+i,dao.getArticleTypeById(Integer.parseInt(entry.getKey())));
        		}
        		i++;
        	}
        }
        

		return ArticleMap;
	}
	
	
	

	public List<Article> getHomePageRecent() {
		List rArticle=dao.getRentArticle();
		return rArticle;
	}

	public List<Article> getHomePageHot() {
		return dao.getHotArticle();
	}

	public List<Friendlink> getHomePageFriendsLink() {
		return dao.getFriendLink();
	}


	public void addGood(Integer id) {
		dao.addGood(id);
	}


	public Integer getReplyNum(Integer id) {
		return dao.getReplyNum(id);
	}


}
