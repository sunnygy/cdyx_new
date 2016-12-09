package com.cdyx.dao;

import com.cdyx.common.util.PageResults;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.springframework.jdbc.core.RowMapper;

/**
 * Created by guyu on 2016/10/3.
 */
public interface BaseDao <T, ID extends Serializable>{



    /**
     * <保存或者更新实体>
     * @param t 实体
     */
    public  void saveOrUpdate(T t);
    

    public Serializable save(T t);

    /**
     * <load>
     * <加载实体的load方法>
     * @param id 实体的id
     * @return 查询出来的实体
     */
    public  T load(ID id);

    /**
     * <get>
     * <查找的get方法>
     * @param id 实体的id
     * @return 查询出来的实体
     */
    public  T get(ID id);

    /**
     * <contains>
     * @param t 实体
     * @return 是否包含
     */
    public  boolean contains(T t);

    /**
     * <delete>
     * <删除表中的t数据>
     * @param t 实体
     */
    public  void delete(T t);

    /**
     * <根据ID删除数据>
     * @param Id 实体id
     * @return 是否删除成功
     */
    public  boolean deleteById(ID Id);

    /**
     * <删除所有>
     * @param entities 实体的Collection集合
     */
    public  void deleteAll(Collection<T> entities);

    /**
     * <执行Hql语句>
     * @param hqlString hql
     * @param values 不定参数数组
     */
    public  void queryHql(String hqlString, Object... values);

    /**
     * <执行Sql语句>
     * @param sqlString sql
     * @param values 不定参数数组
     */
    public  void querySql(String sqlString, Object... values);

    /**
     * <根据HQL语句查找唯一实体>
     * @param hqlString HQL语句
     * @param values 不定参数的Object数组
     * @return 查询实体
     */
    public  T getByHQL(String hqlString, Object... values);

    /**
     * <根据SQL语句查找唯一实体>
     * @param sqlString SQL语句
     * @param values 不定参数的Object数组
     * @return 查询实体
     */
    public  T getBySQL(String sqlString, Object... values);

    /**
     * <根据HQL语句，得到对应的list>
     * @param hqlString HQL语句
     * @param values 不定参数的Object数组
     * @return 查询多个实体的List集合
     */
    public  List<T> getListByHQL(String hqlString, Object... values);

    /**
     * <根据SQL语句，得到对应的list>
     * @param sqlString HQL语句
     * @param values 不定参数的Object数组
     * @return 查询多个实体的List集合
     */
    public  List<T> getListBySQL(String sqlString, Object... values);

    /**
     * 由sql语句得到List
     * @param sql
     * @param map
     * @param values
     * @return List
     */
    @SuppressWarnings("rawtypes")
	public List findListBySql(final String sql, final RowMapper map, final Object... values);

    /**
     * <refresh>
     * @param t 实体
     */
    public  void refresh(T t);

    /**
     * <update>
     * @param t 实体
     */
    public  void update(T t);

    /**
     * <根据HQL得到记录数>
     * @param hql HQL语句
     * @param values 不定参数的Object数组
     * @return 记录总数
     */
    public  Long countByHql(String hql, Object... values);

    /**
     * <HQL分页查询>
     * @param hql HQL语句
     * @param countHql 查询记录条数的HQL语句
     * @param pageNo 下一页
     * @param pageSize 一页总条数
     * @param values 不定Object数组参数
     * @return PageResults的封装类，里面包含了页码的信息以及查询的数据List集合
     */
    public  PageResults<T> findPageByFetchedHql(String hql, String countHql, int pageNo, int pageSize, Object... values);


    public Session getSession();
    
    
  




    
}
