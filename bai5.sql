CREATE DATABASE dtb_bai5ss2;
USE dtb_bai5ss2;

CREATE TABLE CUSTOMERS (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
) ENGINE=InnoDB;

CREATE TABLE WALLETS (
    wallet_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT unique_wallet_per_user UNIQUE (customer_id),
    
    CONSTRAINT fk_wallet_customer
    FOREIGN KEY (customer_id)
    REFERENCES CUSTOMERS(customer_id)
    ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE TRANSACTIONS (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    wallet_id INT NOT NULL,
    type VARCHAR(20) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_transaction_wallet
    FOREIGN KEY (wallet_id)
    REFERENCES WALLETS(wallet_id)
    ON DELETE CASCADE
) ENGINE=InnoDB;