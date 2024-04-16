from smb.SMBConnection import SMBConnection

server_ip = "193.161.193.99"
port = 47524  # Puerto predeterminado para SMB

conn = SMBConnection("", "", "", "")
conn.connect(server_ip, port)

shares = conn.listShares()

print("Recursos compartidos en el servidor:")
for share in shares:
    print(share.name)
