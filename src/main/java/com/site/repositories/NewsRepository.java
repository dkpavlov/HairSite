package com.site.repositories;

import com.site.models.News;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-24
 * Time: 13:25
 */
public interface NewsRepository extends PagingAndSortingRepository<News, Long> {
}
