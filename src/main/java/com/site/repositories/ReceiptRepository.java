package com.site.repositories;

import com.site.models.Receipt;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by dimitar.pavlov.mus on 16.08.2016.
 */
public interface ReceiptRepository extends PagingAndSortingRepository<Receipt, Long> {
    public Page<Receipt> findBySellerUsernameOrderByCreatedAtDesc(String username, Pageable pageable);
    public Receipt findByIdAndSellerUsername(Long id, String username);
    public Receipt findById(Long id);

    @Query("select r from Receipt r where ((:uId is null) or (r.seller.id = :uId)) and " +
            "((:fromDate is null) or (r.createdAt >= :fromDate)) and " +
            "((:toDate is null) or (r.createdAt <= :toDate))")
    public Page<Receipt> selectForReport(@Param("uId") Long uId,
                                         @Param("fromDate") Date fromDate,
                                         @Param("toDate") Date toDate, Pageable pageable);

    @Query("select r from Receipt r where ((:uId is null) or (r.seller.id = :uId)) and " +
            "((:fromDate is null) or (r.createdAt >= :fromDate)) and " +
            "((:toDate is null) or (r.createdAt <= :toDate))")
    public List<Receipt> selectForReport(@Param("uId") Long uId,
                                         @Param("fromDate") Date fromDate,
                                         @Param("toDate") Date toDate);
}
