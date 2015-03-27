package com.site.repositories;

import com.site.models.News;
import com.site.models.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-24
 * Time: 13:25
 */
public interface NewsRepository extends PagingAndSortingRepository<News, Long> {
    public Page<News> findByStatusNot(Status status, Pageable pageable);
    public Page<News> findByStatus(Status status, Pageable pageable);
    public Page<News> findById(Long id, Pageable pageable);
}
