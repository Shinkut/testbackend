const controller ={}
const Reviews = require('../model/Reviews')


controller.read = (req, res)=>{
    req.getConnection((e, con) =>{
        con.query('SELECT p.id, c.Nombre AS CityId, p.name, p.lastname, p.email, p.cellphone, p.photoUrl FROM petsitter p INNER JOIN city c ON c.id = p.CityId INNER JOIN state s ON s.id = c.id order by s.id', (e, petsitter) =>{
            if(e){
                res.json(e)
            }
            con.query('SELECT * from city order by Nombre', (e, city) =>{
                if(e){
                    res.json(e)
                }
            res.render('vpetsitter',{
                data: petsitter,
                cdata: city
            })
            
        })
    })
    })
}

controller.conread = (req,res) =>{
    req.getConnection((e,con)=>{
        if(e){
            res.json(e)
        }
        Reviews.find( {}, (e, review)=>{
            if(e){
                res.json(e)
            }
            con.query('select id, name from petsitter', (e, rows) => {
                if(e) {
                     res.json(e)
                    }
            res.render('vreviews', {
                sdata: rows,
                data: review,
            })
        })
}).sort({petsitterid: -1}) 
    })
}

controller.moninsert = (req, res)=>{
    const reviews = new Reviews({
        petsitterid: req.body.petsitter,
        rating: req.body.rating,
        comments: req.body.comments
    })
    reviews.save(function(e,reviews){
        if(e){
            res.json(e)
        }
        res.redirect('/vreviews')
    })
}



controller.tyread = (req, res)=>{
    req.getConnection((e, con) =>{
        con.query('SELECT p.name, t.description FROM petsitter p INNER JOIN sitterxtype s ON s.petsitterid = p.id INNER JOIN petstype t ON t.id = s.petstypeid  order by p.name;', (e, type) =>{
            if(e){
                res.json(e)
            }
            con.query('select * from petsitter;',(e,sitid)=>{
            if(e){
                res.json(e)
            }
            con.query('select * from petstype;',(e,tyid)=>{
                if(e){
                    res.json(e)
                }
            res.render('vtypes',{
                data: type,
                sitdata: sitid,
                tydata: tyid
            })
            
        })
    })
    })
})
}

controller.insert = (req, res) => {
    const petsitter = req.body
    req.getConnection((e,con)=>{
        if(e){
            res.json(e)
        }
        con.query('Insert into petsitter set ?', [petsitter],(e,petsitter) =>{
            if(e){
                res.json(e)
            }
            res.redirect('/')
        }
        )
    }    
    )
}
controller.tyinsert = (req, res) => {
    const petsitter = req.body
    req.getConnection((e,con)=>{
        if(e){
            res.json(e)
        }
        con.query('Insert into sitterxtype set ?', [petsitter],(e,petsitter) =>{
            if(e){
                res.json(e)
            }
            res.redirect('/vtypes')
        }
        )
    }    
    )
}


controller.update = (req, res) => {
    const id  = req.body.id_updt
    const name  = req.body.name_updt
    const cityId  = req.body.cityId_updt
    const lastname  = req.body.lastname_updt
    const email  = req.body.email_updt
    const cellphone  = req.body.cellphone_updt
    const petsitter = req.body
    req.getConnection((e,con) =>{
        if(e){
            res.json(e)
            console.log('no conecta')
        }
        con.query("UPDATE petsitter SET name='"+name+"', cityId='"+cityId+"', lastname='"+lastname+"', email='"+email+"', cellphone='"+cellphone+"' WHERE petsitter.id= "+id, [petsitter],(e, rows) => {
            if(e){
                res.json(e)
                console.log('error en query')
            }
            res.redirect('/')
    }
    )
  }
  )
}

controller.delete =(req, res) =>{
  const { id } = req.params
   req.getConnection((e,con)=>{
       if(e){
           res.json(e)
       }
       con.query('delete from petsitter where id= ?',[id],(e, rows) =>{
           if(e){
               res.json(e)
           }
           con.query('delete from sitterxtype where petsitterid= ?', [id],(e, rows)=>{
               if(e){
                   res.json(e)
               }
           })
           res.redirect('/')

       })
   })
}
controller.tydelete =(req, res) =>{
    const { id } = req.params
     req.getConnection((e,con)=>{
         if(e){
             res.json(e)
         }
         con.query('delete from sitterxtype where id= ?',[id],(e, rows) =>{
             if(e){
                 res.json(e)
             }
             res.redirect('/vtypes')
  
         })
     })
  }

module.exports = controller