package com.site.repositories;

import com.site.models.Employee;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 11:26
 */

public interface EmployeeRepository extends PagingAndSortingRepository<Employee, Long> {
    public Page<Employee> findByStatus(Status status, Pageable pageable);
    public Page<Employee> findByStatusNot(Status status, Pageable pageable);
    public Page<Employee> findById(Long id, Pageable pageable);
}
