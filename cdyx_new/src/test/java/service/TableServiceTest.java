package service;



import java.util.List;

import org.hibernate.tool.hbm2ddl.TableMetadata;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cdyx.entity.TableList;
import com.cdyx.model.TableListModel;
import com.cdyx.service.TableService;

import dao.BaseTest;
public class TableServiceTest extends BaseTest{
	
	
	
	@Autowired
	private TableService tableService;
	
	
	
	
	@Test
	public void  getAllTablesStatus(){
		
		
		List<TableListModel>tables=tableService.getAllTables();
		
		for (TableListModel tableListModel : tables) {
			
			System.out.println(tableListModel);
		
		}
		
		
		
	}
	
	@Test
	public void getTableById(){

		TableList table=tableService.getTableById(11);
		
		
	}
	
	@Test
	public void saveOrUpdateTable(){
		
		
		
	}
	
	@Test
	public void deleteTable(){
		
		
		
		
	}
	
	@Test
	public void addTable(){
		
		TableList table=null;
		
		for(int i=0;i<10;++i){
			table=new TableList();
			table.setCode(i+"");
			table.setStatus(true);
			table.setDescription("njsdfnjdfn");	
			Integer id=tableService.addTable(table);
			System.out.print("table: "+id+" ");			
		}
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
