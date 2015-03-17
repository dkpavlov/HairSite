package com.site.repositories;

import com.site.models.Contact;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 14:28
 */
public interface ContactRepository extends PagingAndSortingRepository<Contact, Long> {
}
