package kwbbin.blog.utils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 得到1-20的随机数
 * 挑选20次，不重复挑选
 * */
public class GetRandom {
	
	public static List<Integer> getNonredundantNumber(){
		Set<Integer> set=new HashSet<Integer>();
		List<Integer> list=new ArrayList<>();
		int i=0;
		
		
		while(i<20){
			int j=getNumber();
			if(set.add(j)){
				list.add(j);
				i++;
			}
		}
		
		return list;
		
	}
	
	public static Integer getNumber(){
		return (int)(1+Math.random()*20);
	}
}
