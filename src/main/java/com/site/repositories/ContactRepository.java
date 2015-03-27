package com.site.repositories;

import com.site.models.Contact;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 14:28
 */
public interface ContactRepository extends PagingAndSortingRepository<Contact, Long> {

    public List<Contact> findByStatus(Status status);
    public Page<Contact> findByStatusNot(Status status, Pageable pageable);
    public List<Contact> findByStatusNot(Status status);
    public List<Contact> findById(Long id);

}
