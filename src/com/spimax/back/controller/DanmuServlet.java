package com.spimax.back.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spimax.back.entity.Danmu;
import com.spimax.back.entity.Users;
import com.spimax.back.entity.Videos;
import com.spimax.back.service.DanmuService;
import com.spimax.back.service.UsersService;
import com.spimax.back.service.VideosService;
import com.spimax.back.util.PageData;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/DanmuServlet")
public class DanmuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      DanmuService ds = new DanmuService();
      VideosService vs=new VideosService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanmuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		PageData<Users> list = new PageData<Users>();

		if (request.getParameter("op") != null) {
			// 将op的值取出来 判断这个值

			String op = request.getParameter("op");
			if (op.equals("queryAll")) {
				// 分页查询
							
				   String table = "V_DANMU";

				    //获取请求次数
				    String draw = "0";
				    draw = request.getParameter("draw");
				    //数据起始位置
				    String start = request.getParameter("start");			  
				    //数据长度
				    String length = request.getParameter("length");
				    //总记录数
				    String recordsTotal = "0";
				    //过滤后记录数
				    String recordsFiltered = "";
				    //定义列名
				    String[] cols = {"","","DANMUID", "DANMUCONTENT", "VIDEOID","VIDEOTITLE", "USERNAME"};
				    //获取客户端需要那一列排序
				    String orderColumn = "0";
				    orderColumn = request.getParameter("order[0][column]");
				   
				    orderColumn = cols[Integer.parseInt(orderColumn)];
				   
				    //获取排序方式 默认为asc
				    String orderDir = "asc";
				    orderDir = request.getParameter("order[0][dir]");
 

				    //获取用户过滤框里的字符
				    String searchValue = request.getParameter("search[value]");
				   
				    List<String> sArray = new ArrayList<String>();
				    if (!searchValue.equals("")) {
				    	//通过标题检索
				    	List<Integer> idlist=vs.getTypeId(searchValue);
				    	//通过作者检索
				    	List<Integer> idlist1=vs.getTypeIdByUsername(searchValue);
				        sArray.add(" DANMUID like '%" + searchValue + "%'");
				        sArray.add(" DANMUCONTENT like '%" + searchValue + "%'");
				           
				       if(idlist!=null)
				       {  
				    	   for (Integer integer : idlist) {
						   sArray.add(" VIDEOID ="+integer);
					   }
				    	   
				       }
				       if(idlist1!=null)
				       {  
				    	   for (Integer integer : idlist1) {
						   sArray.add(" VIDEOID ="+integer);
					   }
				    	   
				       }
				     
				       sArray.add(" VIDEOID LIKE '%" + searchValue + "%'");
				  
				        
				    }

				    String individualSearch = "";
				    if (sArray.size() == 1) {
				        individualSearch = sArray.get(0);
				    } else if (sArray.size() > 1) {
				        for (int i = 0; i < sArray.size() - 1; i++) {
				            individualSearch += sArray.get(i) + " or ";
				        }
				        individualSearch += sArray.get(sArray.size() - 1);
				    }

				    List<Danmu> danmu = new ArrayList<Danmu>();
				    String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;
				    
				            recordsTotal = String.valueOf(ds.getDanmuCount());
				       


				        String searchSQL = "";
				        String sql = "SELECT * FROM " + table;
				        if (individualSearch != "") {
				            searchSQL = " where " + individualSearch;
				        }
				        sql += searchSQL;
				        recordsFilteredSql += searchSQL;
				        sql += " order by " + orderColumn + " " + orderDir;
				        recordsFilteredSql += " order by " + orderColumn + " " + orderDir;
				      
				        int realstart=0;
				        int startindex0= (Integer.parseInt(start)+1)/(Integer.parseInt (length));
				        int startindex= (Integer.parseInt(start)+1)%(Integer.parseInt (length));
				       
				        if(startindex>0)
				        {
				        	realstart=++startindex0;
				        }
				        else
				        {
				        	realstart=startindex0;
				        }
				      
				        
				     PageData<Danmu> pu=ds.getAllDanmuBySearch(sql,realstart ,Integer.parseInt (length));
				
				     for (Danmu ur : pu.getData()) {
				    	 
				        List<Videos> listv=ds.getAllVIDEOSList(ur.getVIDEOID());
						   
				        for (Videos v : listv) {
							 
							  ur.setVideos(v);
							  
						 }
								  		    
                             danmu.add(ur);
					}
		               

				        if (searchValue != "") {
				           
				                recordsFiltered = String.valueOf(ds.getDanmuCountBySearch(recordsFilteredSql));
				            
				        } else {
				              recordsFiltered = recordsTotal;
				        }
				    


				    Map<Object, Object> info = new HashMap<Object, Object>();
				    info.put("data", danmu); //danmu是一个  List<danmu>
				    info.put("recordsTotal", recordsTotal);
				    info.put("recordsFiltered", recordsFiltered);
				    info.put("draw", draw);
				    
				    String json = new Gson().toJson(info);//? 这里要注意一下 这里有一个json格式的转换
				  
				    out.print(json);
				

			}

			else if(op.equals("delDanmu"))
			{
				  int danmuid=Integer.parseInt (request.getParameter("danmuid"));
				  boolean flag=ds.delectDanmu(danmuid);			  
				  out.print(flag);
			}
			else if(op.equals("delSomeDanmu"))
			{
				if (request.getParameter("danmuid") != null && request.getParameter("danmuid")!="") {
					String[] idsd = request.getParameter("danmuid").split(",");
					boolean flag=false;
					for (int i = 0; i < idsd.length; i++) {
						 flag =ds.delectDanmu(Integer.parseInt(idsd[i]));
					}
					
					 out.print(flag);
				}
			}
		}
	}

}
