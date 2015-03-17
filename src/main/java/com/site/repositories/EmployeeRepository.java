package com.site.repositories;

import com.site.models.Employee;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 11:26
 */

public interface EmployeeRepository extends PagingAndSortingRepository<Employee, Long> {
}
