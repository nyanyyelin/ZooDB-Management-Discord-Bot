const { Client, GatewayIntentBits } = require('discord.js');
const mysql = require('mysql')

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent,
    GatewayIntentBits.GuildMembers,
  ],
});

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  dateStrings: true
  
})


db.connect((err) => {
  if(err) {
    console.error('Database connection failed: ' + err.stack)
    return;
  }

  console.log('Connected to the Database on AWS....')
})


client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}!`)
})



client.on('messageCreate', msg => {

  if(msg.author.bot) return;

  // commands with parameters
  if(msg.content.split(' ').length > 1) {

    const commandParts = msg.content.split(' ');

    if(commandParts[0] === '/first-name-of-employee-salary-greater-than') {

      const sql = `SELECT first_name FROM employee WHERE salary > ${commandParts[1]} `
      db.query(sql, (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))

        let names = '';

        for(let i = 0; i < data.length; i++) {
          names += `${i + 1}. ${data[i]['first_name']} \n`
        }

        msg.reply(names)
      })
      
    } else if(commandParts[0] === '/food-supply-expired-between') {

      const first = commandParts[1]
      const second = commandParts[2]
      
      const sql = `SELECT food_supply_id, supply_name FROM food_supply WHERE expiration_date BETWEEN ? AND ?`

      db.query(sql, [first,second], (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))

        let expiredSupplies = ''

        for(let i = 0; i < data.length; i++) {
          expiredSupplies += `${i+1}. Food Supply ID: ${data[i]['food_supply_id']} , Supply Name: ${data[i]['supply_name']} \n`
        }

        msg.reply(expiredSupplies);
        
      })

    } else if(commandParts[0] === '/add-new-visitor') {

      const newVisitorInfo = {
        visitor_id: commandParts[1],
        email: commandParts[2],
        first_name: commandParts[3],
        last_name: commandParts[4]
      }

      db.query('INSERT INTO visitor SET ?', newVisitorInfo, (err,result) => {
        if(err) throw err;

        msg.reply('Adding new visitor successful.')
      })
      
    } else if(commandParts[0] === '/view-zoo-expense-over') {

      let amount = commandParts[1]
      let sql = `SELECT expense_type, date FROM zoo_expense WHERE cost > ${amount}`

      db.query(sql, (err,result) => {
        
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))
        
        let expenseInfo = '';

        for(let i = 0; i < data.length; i++) {
          expenseInfo += `${i+1}. Expense: "${data[i]['expense_type']}" made on Date: "${data[i]['date']}" \n`
        }

        msg.reply(expenseInfo)
        
      })
      
    } else if(commandParts[0] === '/view-individual-receipt-info') {

      const receiptID = commandParts[1];
      let sql = `SELECT num_adult_ticket, num_child_ticket, total FROM receipt WHERE receipt_id = ${receiptID}`
     
      
      db.query(sql, (err,result) => {
        
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))
        
        let receiptInfo = `Number of Adult Ticket Bought : ${data[0]['num_adult_ticket']} \nNumber of Child Ticket Bought : ${data[0]['num_child_ticket']} \nTotal : ${data[0]['total']}`

        msg.reply(receiptInfo)
        
      })
      
    } else if(commandParts[0] === '/update-visitor-first-name') {

      let visitorID = commandParts[1]
      let newFirstName = commandParts[2]

      let sql = `UPDATE visitor SET first_name = '${newFirstName}' WHERE visitor_id = ${visitorID}`
      db.query(sql, (err,result) => {
        if(err) throw err;

        msg.reply('Update successful.')
      })
      
    } else if(commandParts[0] === '/calculate-total-zoo-expense-between') {

      const first = commandParts[1];
      const second = commandParts[2];

      let sql = `SELECT SUM(cost) FROM zoo_expense WHERE date BETWEEN ? AND ?`
      db.query(sql, [first,second], (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))
        console.log(data)

        let total = data[0]['SUM(cost)']

        msg.reply(`Amount spent between ${first} and ${second} is $ ${total}.`)
        
      })
      
    } else if(commandParts[0] === '/view-medical-supplies-that-will-deliver-after') {

      let date = commandParts[1];

      let sql = `SELECT supply_name FROM medical_supply WHERE future_delivery_date > ?`
      db.query(sql, [date], (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))

        let supplies = ''

        for(let i = 0; i < data.length; i++) {
          supplies += `${i+1}. ${data[i]['supply_name']} \n`
        }

        msg.reply(supplies)
      })
      
    } else if(commandParts[0] === '/view-employees-under-department') {

      const departmentID = commandParts[1]
      let sql = `SELECT first_name, last_name FROM employee WHERE department = ?`

      db.query(sql, [departmentID], (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))

        let names = ''

        for(let i = 0; i < data.length; i++) {
          names += `${i+1}. ${data[i]['first_name']} ${data[i]['last_name']} \n`
        }

        msg.reply(names);
        
      })
      
    } else if(commandParts[0] === '/delete-employee') {
      
      const employeeID = commandParts[1]
      let sql = `Delete FROM employee WHERE emp_id = ?`

      db.query(sql,[employeeID],(err,result) => {
        if(err) throw err;

        msg.reply('Deletion Successful.')
      })
      
    }

    
  
  
  
  
  
  
  } else {

    if(msg.content === '/number-of-animals') {
    
      const sql = 'SELECT COUNT(animal_id) FROM animal'
      db.query(sql, (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))
        const dataString = data[0]['COUNT(animal_id)'].toString();
        msg.reply(`${dataString} animals are in the zoo at this moment.`)
    
      })
      
    } else if(msg.content === '/number-of-employees') {

      const sql = 'SELECT COUNT(emp_id) FROM employee'
      db.query(sql, (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))
        const dataString = data[0]['COUNT(emp_id)'].toString();
        msg.reply(`${dataString} employees are currently employed at the zoo.`)
        
      })

    } else if(msg.content === '/view-employee-ids-who-has-permission-to-edit-animal-records') {

      const sql = 'SELECT emp_id FROM employee_account WHERE acc_id IN ( SELECT emp_acc_id FROM                                     employee_permission WHERE edit_animal_record = 1 )';

      db.query(sql, (err,result) => {
        
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))
        let employeeIDs = '';
        for(let i = 0; i < data.length; i++) {
          employeeIDs += `Employee ID: ${data[i]['emp_id'].toString()} \n`
        }
        msg.reply(employeeIDs);
        
      })
      
    } else if(msg.content === '/view-all-departments-with-manager-name-and-email') {

      let sql = 'SELECT email, first_name, last_name, department_name FROM employee JOIN department ON emp_id = manager'

      db.query(sql, (err,result) => {

        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))

        let dataString = '';

        for(let i = 0; i < data.length; i++) {
          dataString += `${i+1}. Department : ${data[i]['department_name']} \n\t - Manager Name : ${data[i]['first_name']} ${data[i]['last_name']} \n\t - Email : ${data[i]['email']} \n`
        }

        msg.reply(dataString)
        
      })
      
    } else if(msg.content === '/view-all-types-of-tickets') {

      const sql = 'SELECT ticket_type, price FROM ticket'
      let ticketInfo = ''

      db.query(sql, (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))

        for(let i = 0; i < data.length; i++) {
          ticketInfo += `${i+1}. Ticket Type: ${data[i]['ticket_type']} --> Price: ${data[i]['price']} \n`
        }

        msg.reply(ticketInfo)
        
      })
      
    } else if(msg.content === '/view-time-sheet') {

      const sql = 'SELECT emp_id, date, total_hours FROM time_sheet '

      db.query(sql, (err,result) => {
        if(err) throw err;
        let data = JSON.parse(JSON.stringify(result))
        console.log(data)

        let dataString = ''

        for(let i = 0; i < data.length; i++) {
          dataString += `Employee ID: ${data[i]['emp_id']} \t Date: '${data[i]['date']} \t Total Hours: ${data[i]['total_hours']} \n`
        }

        msg.reply(dataString)
      })
      
    }





    
    
  } // main if else

  
}) // message create event


client.login(process.env.DISCORD_TOKEN);
