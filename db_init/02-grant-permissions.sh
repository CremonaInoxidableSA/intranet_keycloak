mysql -u root -p"${MYSQL_ROOT_PASSWORD}" << EOF

-- Grant ALL PRIVILEGES to keycloak_user from any host
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

FLUSH PRIVILEGES;
EOF

if [ $? -eq 0 ]; then
    echo "✓ Keycloak user permissions granted successfully"
else
    echo "✗ Error granting keycloak permissions"
    exit 1
fi
