import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="bank_db"
)

cursor = conn.cursor()

print("\nTASK 1: Initial Accounts")

cursor.execute("SELECT * FROM accounts")

for row in cursor.fetchall():
    print(row)

print("\nTASK 2 & 3: Rollback Transaction Demo")

try:
    conn.start_transaction()

    cursor.execute("""
    INSERT INTO accounts
    VALUES (104,'Demo_User',10000)
    """)

    print("Record inserted temporarily.")

    conn.rollback()

    print("Rollback executed successfully.")

except Exception as e:
    print("Error:", e)

cursor.execute("SELECT * FROM accounts")

print("\nAccounts After Rollback")

for row in cursor.fetchall():
    print(row)

print("\nTASK 4: Commit Transaction Demo")

try:
    conn.start_transaction()

    cursor.execute("""
    INSERT INTO accounts
    VALUES (105,'Committed_User',15000)
    """)

    conn.commit()

    print("Transaction committed successfully.")

except Exception as e:
    print("Error:", e)

cursor.execute("SELECT * FROM accounts")

print("\nAccounts After Commit")

for row in cursor.fetchall():
    print(row)

print("\nTASK 5: Money Transfer Transaction")

try:
    conn.start_transaction()

    transfer_amount = 5000

    # Deduct from 101
    cursor.execute("""
    UPDATE accounts
    SET balance = balance - %s
    WHERE account_id = 101
    """, (transfer_amount,))

    # Add to 102
    cursor.execute("""
    UPDATE accounts
    SET balance = balance + %s
    WHERE account_id = 102
    """, (transfer_amount,))

    conn.commit()

    print("Money transfer successful.")

except Exception as e:
    conn.rollback()
    print("Transfer Failed:", e)

cursor.execute("""
SELECT account_id,
       account_holder,
       balance
FROM accounts
""")

print("\nFinal Account Balances")

for row in cursor.fetchall():
    print(row)

conn.close()