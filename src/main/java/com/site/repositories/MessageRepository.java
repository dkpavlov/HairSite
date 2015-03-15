package com.site.repositories;

import com.site.models.Message;
import com.site.models.News;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 3/15/15
 * Time: 19:10
 */

public interface MessageRepository extends PagingAndSortingRepository<Message, Long> {
}
