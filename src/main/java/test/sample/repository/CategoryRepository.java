package test.sample.repository;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.sample.dao.CategoryDao;
import test.sample.entity.Category;

@Repository
public class CategoryRepository {
	
	@Autowired
	private CategoryDao categoryDao;
	
	
	public Category getCategory(int categoryId){
		
		Category category = categoryDao.findOne(categoryId);
		return category;
	}
	
	public List<Category> findAll(){
		return categoryDao.findAll();
	}
	
	public List<Category> getCategoryList(){
		List<Category> categories = categoryDao.findAll();
		return categories;
	}
	
	public Map<Integer, String> getCategoryMap(){
		return getCategoryList().stream().collect(Collectors.toMap(Category::getId, Category::getName));
	}
	
}
