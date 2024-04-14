package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pojo.Account;
import util.Dbutil;
//Constructor -------------------------------------------------
public class DaoAccount implements Serializable{
	private Connection con;
	public DaoAccount(){
		try {
			con=Dbutil.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("connection done....................");
	}
	
//show account details------------------------------------------------
	public Account getAccountDetails(Account obj) {
	    String str = "select * from bank_account where acc_id=?;";
	    try {
	        PreparedStatement pst = con.prepareStatement(str);
	        pst.setInt(1, obj.getAcc_id());
	        
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            // Retrieve account details from ResultSet and set them in obj
	            obj.setAcc_name(rs.getString("acc_name"));
	            obj.setAcc_balance(rs.getInt("acc_balance"));
	            // You may need to set other properties depending on your database schema
	            obj.setBkid(rs.getString("ifsccode"));
	            System.out.println("show data done");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return obj;
	}
	public int getAccountById(int id) {
	    String str = "select * from bank_account where acc_id=?;";
	    try {
	        PreparedStatement pst = con.prepareStatement(str);
	        pst.setInt(1,id);
	        
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	           Account obj=new Account();
	           obj.setAcc_balance(rs.getInt("acc_balance"));
	            
	            System.out.println("show data done");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return 0;
	    
	}
	
	//deposit-------------------------------------------------
	public int depositAmount(int id,int amount) {
		
		String str="update  bank_account set acc_balance=acc_balance + ? where acc_id=?";
		try {
			PreparedStatement pst=con.prepareStatement(str);
			pst.setInt(1,amount);
			pst.setInt(2,id);
			pst.executeUpdate();
			System.out.println("depo done............");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	public int withdrawAmount(int id,int amount) {
		String str="update  bank_account set acc_balance=acc_balance - ? where acc_id=?";
		try {
			PreparedStatement pst=con.prepareStatement(str);
			pst.setInt(1,amount);
			pst.setInt(2,id);
			pst.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
     
public Account  removeAccount(int id) {
		
		String str="delete from bank_account where acc_id=?;";
		try {
			PreparedStatement pst=con.prepareStatement(str);
			pst.setInt(1,id);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
		
	}

 
//insert or reqigter account

public boolean InsertData(Account obj) {
    Connection con = null;
    PreparedStatement pst = null;
    boolean success = false;

    try {
        // Get a database connectio
    	try {
			con=Dbutil.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
System.out.println("connection done");
        // Prepare SQL statement
        String sql = "INSERT INTO bank_account (acc_id, acc_name, acc_password, acc_balance) VALUES (?, ?, ?, ?)";
        pst = con.prepareStatement(sql);

        // Set parameters for the SQL statement
        pst.setInt(1, obj.getAcc_id());
        pst.setString(2, obj.getAcc_name());
        pst.setString(3, obj.getAcc_password());
        pst.setInt(4, obj.getAcc_balance());
       
        // Execute the SQL statement
        int rowsAffected = pst.executeUpdate();
        
        // Check if insertion was successful
        if (rowsAffected > 0) {
            success = true;
            System.out.println("row inserted");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Print stack trace for debugging
    } finally {
        // Close PreparedStatement and Connection
        if (pst != null) {
            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Print stack trace for debugging
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Print stack trace for debugging
            }
        }
    }
    return success;
}

public Account checkValid(int id, String password) {
    String sql = "SELECT * FROM bank_account WHERE acc_id = ? AND acc_password = ?";
    try {
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, id);
        pst.setString(2, password);
        
        
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
        	System.out.println("account validate");
            Account ac = new Account();
            ac.setAcc_id(rs.getInt("acc_id"));
           
            ac.setAcc_password(rs.getString("acc_password"));
            ac.setAcc_name(rs.getString("acc_name"));
            ac.setAcc_id(rs.getInt("acc_balance"));
            // Set other properties of the Account object if needed
            
            return ac; // Return the retrieved account
        } else {
            System.out.println("Account not found");
            return null;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    }
}

}
