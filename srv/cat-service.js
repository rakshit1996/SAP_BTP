/**
 * Implementation for CatalogService defined in ./user-service.cds (consuming the user-service.cds here)
 */
module.exports = (srv)=>{
  
    // Use reflection to get the csn definition of Books
    const {Books} = cds.entities
 
   // event handler before and selecte all methods "*" 
  
    srv.before("*",(req) =>{
      console.debug("------you are requesting following methode::","CRUD operation =",req.method,", And serive.entity_type=",req.target.name)

    })

      // Add some discount for overstocked books for First read and after reading the data  usinf event handlers like.after and read methode
      srv.after ('READ','Books', (each)=>{
        

        if (each.stock > 50) each.title += ' -- 11% discount!'
        console.log(each)
    
      })

  
    // Reduce stock of books before creating order upon incoming orders
    srv.before ('CREATE','Orders', async (req)=>{
      const tx = cds.transaction(req), order = req.data;
      if (order.Items) {
        const affectedRows = await tx.run(order.Items.map(item =>
          UPDATE(Books) .where({ID:item.book_ID})
            .and(`stock >=`, item.amount)
            .set(`stock -=`, item.amount)
          )
        )
        if (affectedRows.some(row => !row)) req.error(409, 'Sold out, sorry')
      }
    })
  
  }


  // .after .before and on are event handlers used to run