module.exports = {
  apps: [
    {
      name: 'yourappname',
      script: 'dist/src/main.js',
      env: {
        SALT:"5hEidaaO7UyO15DC59qpViU5RmuIBrX8YC7jd3thEtw7WCQTx88PveS",
        PORT:8001,
        GRAPHQL_PATH:"/graphql",
        GRAPHQL_PLAYGROUND:true,
        GRAPHQL_DEBUG:true,
        POSTGRES_HOST:"localhost",
        POSTGRES_PORT:5432,
        POSTGRES_DB:"sequelize",
        POSTGRES_USERNAME:"postgres",
        POSTGRES_PASSWORD:"root",
        JWT_SECRET:"eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTY0ODgwNzQ2MiwiaWF0IjoxNjQ4ODA3NDYyfQ.x4UoMjwRPrRFZlxaWjgtmF1HuxOnE0wHOvPl_yE_76I",
        JWT_EXPIRES:86400,
        EMAIL_HOST:"smtp.zoho.in",
        EMAIL_ADDRESS:"sagar.patel@iflair.com",
        EMAIL_PASSWORD:"VLXVbuFZ8GdX",
        STRIPE_PUBLIC_KEY:"pk_test_51NDl2HSFdisKFUZ4endJQmPEcujwJifjJsYz7usBt4m11ya8Q56fPm7YiMw90Nf74gSORFk502lQ2RSaN7fP4SQe00OKgAFbOn",
        STRIPE_SECRET_KEY:"sk_test_51NDl2HSFdisKFUZ4Exno1ps16WO3qCfimn4kG2JLpoilHOHWGc4jvyBOSFw8cFkqB2jW7S3Tzs3nyfe6LQiWaCh900OYaKQVU8",
        RAZORPAY_KEY_ID:"rzp_test_WPfthapJodICNc",
        RAZORPAY_KEY_SECRET:"OVjFm5WdgwZtg38XBHz34cwY",
      },
    },
  ],
};
