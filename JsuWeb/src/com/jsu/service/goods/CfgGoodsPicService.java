package com.jsu.service.goods;

import com.jsu.entity.CfgGoodsPicDO;

public interface CfgGoodsPicService {

	/**
	 * 保存（新增/修改）商品关联图片
	 * @param cfgGoodsPicDO
	 * @return
	 */
	public String save(CfgGoodsPicDO cfgGoodsPicDO);
}
