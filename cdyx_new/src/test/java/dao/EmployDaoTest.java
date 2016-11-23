package dao;

import com.cdyx.dao.EmployDao;
import com.cdyx.dao.PositionDao;
import com.cdyx.entity.Employee;
import com.cdyx.entity.Position;
import com.cdyx.service.EmployService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by guyu on 2016/10/4.
 */
public class EmployDaoTest  extends BaseTest{

    @Autowired
    private EmployDao employDao;

    @Autowired
    private EmployService employService;

    @Autowired
    private PositionDao positionDao;


    @Test
    public void testAdd(){
        Employee employee=new Employee();
        Position pos=new Position();
        pos.setCnName("gjhghjgh");
        positionDao.save(pos);
        employee.setPos(pos);
        employee.setAge((short)15);
        employee.setName("79797979");
        employee.setPassword("13214231321");
        employee.setSex(true);
        employee.setPos(pos);
       employDao.saveOrUpdate(employee);


    }
}
