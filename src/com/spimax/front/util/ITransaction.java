package com.spimax.front.util;


import java.sql.Connection;

/**
 * ����ִ�нӿ�
 */
public interface ITransaction {
	/**
	 * ����ִ�з���
	 * 
	 * @param conn
	 *            ���ݿ����Ӷ���
	 * @return ִ�н��
	 */
	public Object execute(Connection conn);
}
