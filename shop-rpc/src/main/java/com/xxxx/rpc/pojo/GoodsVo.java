package com.xxxx.rpc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsVo implements Serializable {
    private static final long serialVersionUID=1L;
    private Integer goodsId;
    private String goodsName;
    private String goodsNameH1;
    private BigDecimal marketPrice;
    private String originalImg;


}
