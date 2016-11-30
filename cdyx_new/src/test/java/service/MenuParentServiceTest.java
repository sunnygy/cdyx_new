package service;



import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cdyx.entity.MenuParent;
import com.cdyx.entity.MenuType;
import com.cdyx.service.MenuParentService;

import dao.BaseTest;
public class MenuParentServiceTest extends BaseTest{
	
	
	
	@Autowired
	private MenuParentService menuParentService;
	
	
	
	
	@Test
	public void  getAllMenuParents(){
		
		
		List<MenuParent>parents=menuParentService.getAllMenuParent();
		
		for (MenuParent menuParent : parents) {
			
			List<MenuType>types=menuParent.getTypes();
			
			System.out.println(types.size());
			
		}
		
	
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
