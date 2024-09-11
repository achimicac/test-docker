#Choose runtime base image
FROM node:18
#Defined main work directory ถ้าไม่แน่ใจ ให้ใช้ตาม doc ไปก่อน
WORKDIR /usr/src/app
#After WORKDIR จพเป็นคำสั่งที่เมื่อเปิดมาปุ้บมันทำงานเลย เช่น เริ่มด้วย npm init แต่เราลงไปแล้ว เลยไม่ต้อง
COPY ./package.json ./
RUN npm install
#ป้อนไฟล์ภายนอกเข้าไปใน docker เพื่อเอาไปสร้างเป็น container เพราะ docker ไม่รู้จักโลกภายนอก
#./index.js คือเอาไฟล์ไฟนจากไหน หลังเว้นวรรค คือเอาไปเก็บไว้ที่ไหน
#อันนีี้ index จะถูกเก็บไว้ที่ /usr.src/app/index.js
COPY ./index.js ./
EXPOSE 8000
#คำสั่ง run project
CMD [ "node", "index.js" ]