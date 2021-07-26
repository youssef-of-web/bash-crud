#!/bin/bash

npm install express mongoose --save

case $1 in 
"make")
#create routes folder if not exist
mkdir routes
mkdir controllers
touch controllers/$2.js


#echo script
echo "
const express = require('express');
const Router = express();
const Controllers = require('../Controllers/$2');

Router.post('/$2', Controllers.Add)
Router.get('/$2', Controllers.GetAll)
Router.get('/$2/:id', Controllers.GetOne)
Router.patch('/$2/:id', Controllers.UpdateOne)
Router.delete('/$2/:id', Controllers.DeleteOne)

module.exports = Router;
"> routes/router$2.js



#echo script
echo "
const $2 = require('../models/$2');

/* Add $2 */
const Add = async(req,res)=>{
 try{
 await  $2.create(req.body)
 res.status(201).json({
     success: true
 })
 }catch(error){
   res.status(404).json({error: error.message})
 }
}

/* GetAll $2 */
const GetAll = async(req,res)=>{
 try{
 const data = await  $2.find()
 res.status(201).json(data)
 }catch(error){
   res.status(404).json({error: error.message})
 }
}

/* GetOne $2 */
const GetOne = async(req,res)=>{
 try{
 const data = await  $2.find({_id : req.params.id})
 res.status(201).json(data)
 }catch(error){
   res.status(404).json({error: error.message})
 }
}

/* UpdateOne $2 */
const UpdateOne = async(req,res)=>{
 try{
 const data = await  $2.findOneAndUpdate(
      { _id: req.params.id },
       req.body ,
      { new: true }
     )
 res.status(201).json(data)
 }catch(error){
   res.status(404).json({error: error.message})
 }
}

/* DeleteOne $2 */
const DeleteOne = async(req,res)=>{
 try{
 await  $2.deleteOne({_id : req.params.id})
 res.status(201).json({
     message: 'deleted'
 })
 }catch(error){
   res.status(404).json({error: error.message})
 }
}


module.exports = {
    Add,
    GetAll,
    GetOne,
    UpdateOne,
    DeleteOne
};
"> controllers/$2.js

;;

"models")
mkdir models
touch models/$2.js

echo "
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const $2Schema = new Schema({

}, { timestamps: true })

module.exports = mongoose.model('$2', $2Schema)
"> models/$2.js
;;
esac                


