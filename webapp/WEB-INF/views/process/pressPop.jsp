<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/donghwa/css/process/pressPop.css">
    <jsp:include page="../include/pluginpage.jsp"/>
  
  <style>
   a,
   button,
   input,
   select,
   h1,
   h2,
   h3,
   h4,
   h5,
   * {
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       border: none;
       text-decoration: none;
       background: none;
   
       -webkit-font-smoothing: antialiased;
   }
   
   menu, ol, ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
   }
   .group-3,
.group-3 * {
  box-sizing: border-box;
}
.group-3 {
  height: 759px;
  position: relative;
}
.group-1 {
  width: 1918px;
  height: 759px;
  position: static;
}
.wrapper {
  width: 1918px;
  height: 759px;
  position: static;
}
.header {
  background: #123478;
  width: 1918px;
  height: 40.35px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.footer {
  background: #123478;
  width: 1918px;
  height: 62.61px;
  position: absolute;
  left: 0px;
  top: 696.39px;
}
.main {
  background: #ffffff;
  width: 1918px;
  height: 656.04px;
  position: absolute;
  left: 0px;
  top: 40.35px;
}
.hamburger-icon-svg-1 {
  width: 33px;
  height: 22.96px;
  position: absolute;
  left: 13px;
  top: 31.31px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, -1);
  object-fit: cover;
}
.group-2 {
  width: 1173px;
  height: 611px;
  position: static;
}
.press-box {
  background: #d9d9d9;
  width: 1173px;
  height: 611px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.press-header {
  background: #282828;
  border-style: solid;
  border-color: #000000;
  border-width: 1px;
  width: 1173px;
  height: 46px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.press-main {
  background: #e6e6e6;
  border-style: solid;
  border-color: #000000;
  border-width: 1px;
  width: 1173px;
  height: 567px;
  position: absolute;
  left: 0px;
  top: 44px;
}
.close {
  width: 33px;
  height: 24px;
  position: absolute;
  left: 1129px;
  top: 10px;
  object-fit: cover;
}
.press {
  color: #ffffff;
  text-align: left;

  font-size: 30px;
  font-weight: 700;
  position: absolute;
  left: 10px;
  top: 4px;
  width: 93px;
  height: 37px;

}
.press-cap {
  background: #23e471;
  width: 358px;
  height: 33px;
  position: absolute;
  left: 19px;
  top: 65px;
}
.press-capacity {
  color: #000000;
  text-align: left;

  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 71px;
  width: 144px;
  height: 19px;
}
.press-cap-box-1 {
  background: #ffffff;
  width: 195px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 99px;
}
.auto {
  color: #000000;
  text-align: left;

  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 325px;
  top: 71px;
  width: 47px;
  height: 19px;
}
.wic-22-4-2-x {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 103px;
  width: 220px;
  height: 21px;
}
.press-cap-val-1 {
  background: #ffffff;
  width: 162px;
  height: 31px;
  position: absolute;
  left: 216px;
  top: 99px;
}
.press-cap-box-2 {
  background: #ffffff;
  width: 195px;
  height: 32px;
  position: absolute;
  left: 19px;
  top: 131px;
}
.wsp-22-4-2-x {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 136px;
  width: 130px;
  height: 21px;
}
.press-cap-val-2 {
  background: #ffffff;
  width: 162px;
  height: 32px;
  position: absolute;
  left: 216px;
  top: 131px;
}
.force-sensor {
  background: #23e471;
  width: 358px;
  height: 32px;
  position: absolute;
  left: 19px;
  top: 181px;
}
.force-sensor2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 188px;
  width: 127px;
  height: 19px;
}
.force-sensor-box-1 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 214px;
}
.wic-22-4-2-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 219px;
  width: 200px;
  height: 21px;
}
.force-sensor-val-1 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 214px;
}
.force-sensor-box-2 {
  background: #ffffff;
  width: 169px;
  height: 32px;
  position: absolute;
  left: 19px;
  top: 247px;
}
.wic-22-4-2-2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 253px;
  width: 220px;
  height: 19px;
}
.force-sensor-val-2 {
  background: #ffffff;
  width: 187px;
  height: 32px;
  position: absolute;
  left: 191px;
  top: 247px;
}
.force-sensor-box-3 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 280px;
}
.wic-22-4-2-3 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 285px;
  width: 220px;
  height: 22px;
}
.force-sensor-val-3 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 280px;
}
.force-sensor-box-4 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 313px;
}
.wic-22-4-2-4 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 317px;
  width: 227px;
  height: 23px;
}
.force-sensor-val-4 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 313px;
}
.force-sensor-box-5 {
  background: #ffffff;
  width: 169px;
  height: 32px;
  position: absolute;
  left: 19px;
  top: 345px;
}
.wic-22-4-2-5 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 349px;
  width: 220px;
  height: 23px;
}
.force-sensor-val-5 {
  background: #ffffff;
  width: 187px;
  height: 32px;
  position: absolute;
  left: 191px;
  top: 345px;
}
.force-sensor-box-6 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 379px;
}
.wic-22-4-2-6 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 383px;
  width: 220px;
  height: 22px;
}
.force-sensor-val-6 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 379px;
}
.force-sensor-box-7 {
  background: #ffffff;
  width: 169px;
  height: 32px;
  position: absolute;
  left: 19px;
  top: 411px;
}
.wic-22-4-2-7 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 416px;
  width: 220px;
  height: 21px;
}
.force-sensor-val-7 {
  background: #ffffff;
  width: 187px;
  height: 32px;
  position: absolute;
  left: 191px;
  top: 411px;
}
.force-sensor-box-8 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 444px;
}
.wic-22-4-2-8 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 448px;
  width: 229px;
  height: 23px;
}






.wic-22-4-2-9 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 477px;
  width: 229px;
  height: 23px;
}


.wic-22-4-2-10 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 509px;
  width: 229px;
  height: 23px;
}

.wic-22-4-2-11 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 541px;
  width: 229px;
  height: 23px;
}

.wic-22-4-2-12 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 574px;
  width: 229px;
  height: 23px;
}


.force-sensor-val-8 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 444px;
}
.tara {
  background: #23e471;
  width: 358px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 496px;
}

.tara2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 501px;
  width: 43px;
  height: 21px;
}


.tara-val-1 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 477px;
}

.tara-box-1 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 477px;
}





.tara-val-2 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 509px;
}

.tara-box-2 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 509px;
}



.tara-val-3 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 541px;
}

.tara-box-3 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 541px;
}



.tara-val-4 {
  background: #ffffff;
  width: 187px;
  height: 31px;
  position: absolute;
  left: 191px;
  top: 574px;
}

.tara-box-4 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 19px;
  top: 574px;
}























.tara-ok2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 27px;
  top: 567px;
  width: 76px;
  height: 19px;
}
.position-1 {
  background: #23e471;
  width: 357px;
  height: 33px;
  position: absolute;
  left: 408px;
  top: 65px;
}
.auto2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 713px;
  top: 71px;
  width: 46px;
  height: 19px;
}
.position {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 71px;
  width: 78px;
  height: 19px;
}
.position-box-1 {
  background: #ffffff;
  width: 193px;
  height: 31px;
  position: absolute;
  left: 408px;
  top: 99px;
}
.gic-22-2-60-10 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 103px;
  width: 142px;
  height: 21px;
}
.position-val-1 {
  background: #ffffff;
  width: 162px;
  height: 31px;
  position: absolute;
  left: 603px;
  top: 99px;
}
.position-box-2 {
  background: #ffffff;
  width: 193px;
  height: 32px;
  position: absolute;
  left: 408px;
  top: 131px;
}
.gsp-22-2-60-10 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 136px;
  width: 148px;
  height: 21px;
}
.position-val-2 {
  background: #ffffff;
  width: 162px;
  height: 32px;
  position: absolute;
  left: 603px;
  top: 131px;
}
.position2 {
  background: #23e471;
  width: 357px;
  height: 32px;
  position: absolute;
  left: 408px;
  top: 181px;
}
.position3 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 188px;
  width: 78px;
  height: 19px;
}
.position-box-3 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 408px;
  top: 214px;
}
.gic-22-1-60-20 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 219px;
  width: 140px;
  height: 21px;
}
.position-val-3 {
  background: #ffffff;
  width: 185px;
  height: 31px;
  position: absolute;
  left: 580px;
  top: 214px;
}
.ref-point {
  background: #23e471;
  width: 357px;
  height: 31px;
  position: absolute;
  left: 408px;
  top: 263px;
}
.ref-point2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 267px;
  width: 156px;
  height: 21px;
}
.ref-point-box-1 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 408px;
  top: 295px;
}
.start {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 300px;
  width: 249px;
  height: 21px;
}
.ref-point-val-1 {
  background: #ffffff;
  width: 185px;
  height: 31px;
  position: absolute;
  left: 580px;
  top: 295px;
}
.ref-point-box-2 {
  background: #ffffff;
  width: 169px;
  height: 30px;
  position: absolute;
  left: 408px;
  top: 328px;
}
.actual {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 332px;
  width: 362px;
  height: 22px;
}
.ref-point-val-2 {
  background: #ffffff;
  width: 185px;
  height: 30px;
  position: absolute;
  left: 580px;
  top: 328px;
}
.mid-box-1 {
  background: #ffffff;
  width: 357px;
  height: 32px;
  position: absolute;
  left: 408px;
  top: 448px;
}
._1 {
  background: #e3e3e3;
  width: 16px;
  height: 29px;
  position: absolute;
  left: 748px;
  top: 450px;
}
.extrusion-die-in-upper-position {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 454px;
  width: 296px;
  height: 21px;
}
.mid-box-2 {
  background: #ffffff;
  width: 357px;
  height: 31px;
  position: absolute;
  left: 408px;
  top: 487px;
}
._2 {
  background: #e3e3e3;
  width: 16px;
  height: 29px;
  position: absolute;
  left: 748px;
  top: 488px;
}
.reference-point-latched {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 492px;
  width: 241px;
  height: 19px;
}
.mid-box-3 {
  background: #ffffff;
  width: 357px;
  height: 31px;
  position: absolute;
  left: 408px;
  top: 524px;
}
._3 {
  background: #e3e3e3;
  width: 16px;
  height: 28px;
  position: absolute;
  left: 748px;
  top: 525px;
}
.batch-reached {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 530px;
  width: 148px;
  height: 19px;
}
.mid-box-4 {
  background: #ffffff;
  width: 357px;
  height: 32px;
  position: absolute;
  left: 408px;
  top: 562px;
}
._4 {
  background: #e3e3e3;
  width: 16px;
  height: 28px;
  position: absolute;
  left: 748px;
  top: 563px;
}
.alternating-force-active {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 567px;
  width: 234px;
  height: 19px;
}
.pressure {
  background: #b0cafd;
  width: 358px;
  height: 33px;
  position: absolute;
  left: 795px;
  top: 65px;
}
.pressure-box-1 {
  background: #ffffff;
  width: 194px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 99px;
}
.hydraulic-oil-system-pressure {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 71px;
  width: 294px;
  height: 19px;
}
.pressure-val-1 {
  background: #ffffff;
  width: 162px;
  height: 31px;
  position: absolute;
  left: 991px;
  top: 99px;
}
.pi-22-1-51-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 103px;
  width: 153px;
  height: 21px;
}
.a-1 {
  background: #b0cafd;
  width: 358px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 148px;
}
.a-1-box-1 {
  background: #ffffff;
  width: 194px;
  height: 32px;
  position: absolute;
  left: 795px;
  top: 180px;
}
.hydraulic-pressure-cylinder-a-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 152px;
  width: 294px;
  height: 22px;
}
.a-1-val-1 {
  background: #ffffff;
  width: 162px;
  height: 32px;
  position: absolute;
  left: 991px;
  top: 180px;
}
.pi-22-1-51-2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 184px;
  width: 107px;
  height: 22px;
}
.a-2 {
  background: #b0cafd;
  width: 358px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 219px;
}
.a-2-box-1 {
  background: #ffffff;
  width: 194px;
  height: 30px;
  position: absolute;
  left: 795px;
  top: 253px;
}
.hydraulic-pressure-cylinder-a-2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 225px;
  width: 299px;
  height: 19px;
}
.a-2-val-1 {
  background: #ffffff;
  width: 162px;
  height: 30px;
  position: absolute;
  left: 991px;
  top: 253px;
}
.pi-22-1-51-3 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 257px;
  width: 107px;
  height: 22px;
}
.b-1 {
  background: #b0cafd;
  width: 358px;
  height: 30px;
  position: absolute;
  left: 795px;
  top: 294px;
}
.b-1-box-1 {
  background: #ffffff;
  width: 194px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 326px;
}
.hydraulic-pressure-cylinder-b-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 298px;
  width: 294px;
  height: 21px;
}
.b-1-val-1 {
  background: #ffffff;
  width: 162px;
  height: 31px;
  position: absolute;
  left: 991px;
  top: 326px;
}
.pi-22-1-51-4 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 331px;
  width: 108px;
  height: 22px;
}
.b-2 {
  background: #b0cafd;
  width: 358px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 367px;
}
.b-2-box-1 {
  background: #ffffff;
  width: 194px;
  height: 32px;
  position: absolute;
  left: 795px;
  top: 399px;
}
.hydraulic-pressure-cylinder-b-2 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 372px;
  width: 299px;
  height: 21px;
}
.b-2-val-1 {
  background: #ffffff;
  width: 162px;
  height: 32px;
  position: absolute;
  left: 991px;
  top: 399px;
}
.pi-22-1-51-5 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 405px;
  width: 107px;
  height: 22px;
}
.tem {
  background: #fa8f8f;
  width: 358px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 454px;
}
.tem-box-1 {
  background: #ffffff;
  width: 194px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 487px;
}
.hydraulic-oil-temperature {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 459px;
  width: 253px;
  height: 21px;
}
.tem-val-1 {
  background: #ffffff;
  width: 162px;
  height: 31px;
  position: absolute;
  left: 991px;
  top: 487px;
}
.tis-22-1-5-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 492px;
  width: 107px;
  height: 19px;
}
.level {
  background: #23e471;
  width: 358px;
  height: 31px;
  position: absolute;
  left: 795px;
  top: 530px;
}
.level-box-1 {
  background: #ffffff;
  width: 194px;
  height: 32px;
  position: absolute;
  left: 795px;
  top: 562px;
}
.hydraulic-oil-fill-level {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 534px;
  width: 215px;
  height: 21px;
}
.level-val-1 {
  background: #ffffff;
  width: 162px;
  height: 32px;
  position: absolute;
  left: 991px;
  top: 562px;
}
.wis-22-1-5-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 801px;
  top: 567px;
  width: 113px;
  height: 19px;
}
   
   
   .position2-1 {
  background: #23e471;
  width: 357px;
  height: 32px;
  position: absolute;
  left: 408px;
  top: 368px;
}
.position3-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 370px;
  width: 378px;
  height: 19px;
}
.position-box-3-1 {
  background: #ffffff;
  width: 169px;
  height: 31px;
  position: absolute;
  left: 408px;
  top: 401px;
}
.gic-22-1-60-20-1 {
  color: #000000;
  text-align: left;
  
  font-size: 19px;
  font-weight: 400;
  position: absolute;
  left: 414px;
  top: 406px;
  width: 240px;
  height: 21px;
}
.position-val-3-1 {
  background: #ffffff;
  width: 185px;
  height: 31px;
  position: absolute;
  left: 580px;
  top: 401px;
}
   
   
   
   
   </style>
  <title>Document</title>
</head>
<body>
 

    <div class="press-box"></div>
    <div class="press-header"></div>
    <div class="press-main"></div>

    <div class="press		">Press</div>
    <div class="press-cap"></div>
    <div class="press-capacity">Press capacity</div>
    <div class="press-cap-box-1"></div>
    <div class="auto">Auto</div>
    <div class="wic-22-4-2-x">Current Load</div>
    <div class="press-cap-val-1 D11105"></div>
    <div class="press-cap-box-2"></div>
    <div class="wsp-22-4-2-x">Set Load</div>
    <div class="press-cap-val-2 D11013	"></div>
    <div class="force-sensor"></div>
    <div class="force-sensor2">Force sensor</div>
    <div class="force-sensor-box-1"></div>
    <div class="wic-22-4-2-1 ">Load Sensor1</div>
    <div class="force-sensor-val-1 D7981"></div>
    <div class="force-sensor-box-2"></div>
    <div class="wic-22-4-2-2">Load Sensor2</div>
    <div class="force-sensor-val-2 D7982"></div>
    <div class="force-sensor-box-3"></div>
    <div class="wic-22-4-2-3">Load Sensor3</div>
    <div class="force-sensor-val-3 D7983"></div>
    <div class="force-sensor-box-4"></div>
    <div class="wic-22-4-2-4">Load Sensor4</div>
    <div class="force-sensor-val-4 D7984"></div>
    <div class="force-sensor-box-5"></div>
    <div class="wic-22-4-2-5">Load Sensor5</div>
    <div class="force-sensor-val-5 D7985"></div>
    <div class="force-sensor-box-6"></div>
    <div class="wic-22-4-2-6">Load Sensor6</div>
    <div class="force-sensor-val-6 D7986"></div>
    <div class="force-sensor-box-7 "></div>
    <div class="wic-22-4-2-7">Load Sensor7</div>
    <div class="force-sensor-val-7 D7987"></div>
    <div class="force-sensor-box-8"></div>
    <div class="wic-22-4-2-8 ">Load Sensor8</div>
    <div class="force-sensor-val-8 D7988"></div>

    <div class="tara-box-1"></div>
      <div class="wic-22-4-2-9 ">Load Sensor9</div>
    <div class="tara-val-1 D7989"></div>
    
        <div class="tara-box-2"></div>
          <div class="wic-22-4-2-10 ">Load Sensor10</div>
    <div class="tara-val-2 D7990"></div>
    
        <div class="tara-box-3"></div>
          <div class="wic-22-4-2-11 ">Load Sensor11</div>
    <div class="tara-val-3 D7991"></div>
    
        <div class="tara-box-4"></div>
          <div class="wic-22-4-2-12 ">Load Sensor12</div>
    <div class="tara-val-4 D7992"></div>


    <div class="position-1"></div>
    <div class="auto2">Auto</div>
    <div class="position">Position</div>
    <div class="position-box-1"></div>
    <div class="gic-22-2-60-10">Front Press</div>
    <div class="position-val-1 D11101"></div>
    <div class="position-box-2"></div>
    <div class="gsp-22-2-60-10">Rear Press</div>
    <div class="position-val-2 D11102"></div>
    <div class="position2"></div>
    <div class="position3">Position</div>
    <div class="position-box-3"></div>
    <div class="gic-22-1-60-20">Seg. Start</div>
    <div class="position-val-3"></div>
    <div class="ref-point"></div>
    <div class="ref-point2">Reference Point</div>
    <div class="ref-point-box-1"></div>
    <div class="start">Initial Position</div>
    <div class="ref-point-val-1"></div>
    <div class="ref-point-box-2"></div>
    <div class="actual">Initial Height</div>
    <div class="ref-point-val-2"></div>
    <div class="mid-box-1"></div>
    <div class="_1 M8165"></div>
    <div class="extrusion-die-in-upper-position">
      Extrusion die in upper Position
    </div>
    <div class="mid-box-2"></div>
    <div class="_2"></div>
    <div class="reference-point-latched">Reference Point Latched</div>
    <div class="mid-box-3"></div>
    <div class="_3"></div>
    <div class="batch-reached">Batch Reached</div>
    <div class="mid-box-4"></div>
    <div class="_4"></div>
    <div class="alternating-force-active">Alternating Force Active</div>
    <div class="pressure"></div>
    <div class="pressure-box-1"></div>
    <div class="hydraulic-oil-system-pressure">
      Hydraulic Oil System Pressure
    </div>
    <div class="pressure-val-1"></div>
    <div class="pi-22-1-51-1">PI 22.1.51.1</div>
    <div class="a-1"></div>
    <div class="a-1-box-1"></div>
    <div class="hydraulic-pressure-cylinder-a-1">
      Hydraulic pressure cylinder A1
    </div>
    <div class="a-1-val-1"></div>
    <div class="pi-22-1-51-2">PI 22.1.51.2</div>
    <div class="a-2"></div>
    <div class="a-2-box-1"></div>
    <div class="hydraulic-pressure-cylinder-a-2">
      Hydraulic pressure cylinder A2
    </div>
    <div class="a-2-val-1"></div>
    <div class="pi-22-1-51-3">PI 22.1.51.3</div>
    <div class="b-1"></div>
    <div class="b-1-box-1"></div>
    <div class="hydraulic-pressure-cylinder-b-1">
      Hydraulic pressure cylinder B1
    </div>
    <div class="b-1-val-1"></div>
    <div class="pi-22-1-51-4">PI 22.1.51.4</div>
    <div class="b-2"></div>
    <div class="b-2-box-1"></div>
    <div class="hydraulic-pressure-cylinder-b-2">
      Hydraulic pressure cylinder B2
    </div>
    <div class="b-2-val-1"></div>
    <div class="pi-22-1-51-5">PI 22.1.51.5</div>
    <div class="tem"></div>
    <div class="tem-box-1"></div>
    <div class="hydraulic-oil-temperature">Hydraulic Oil Temperature</div>
    <div class="tem-val-1"></div>
    <div class="tis-22-1-5-1">TIS 22.1.5.1</div>
    <div class="level"></div>
    <div class="level-box-1"></div>
    <div class="hydraulic-oil-fill-level">Hydraulic Oil Fill Level</div>
    <div class="level-val-1"></div>
    <div class="wis-22-1-5-1">WIS 22.1.5.1</div>




    <div class="position2-1"></div>
    <div class="position3-1">Force Sensor 1 ~ 12 </div>
    <div class="position-box-3-1"></div>
    <div class="gic-22-1-60-20-1">Force Sensor Sum</div>
    <div class="position-val-3-1 D7995">?</div>


<script>

var overviewInterval;

//로드
$(function(){
	overviewListView();
	overviewInterval = setInterval("overviewListView()", 500);
});

//OPC값 알람 조회
function overviewListView(){
	$.ajax({
		url:"/donghwa/process/press/view",
		type:"post",
		dataType:"json",
		success:function(result){				
			var data = result.multiValues;
			
        for(let key in data){
        	for(let keys in data[key]){
        		var d = data[key];

					if(d[keys].action == "v"){
						v(keys, d[keys].value);
					}else if(d[keys].action == "c"){
						c(keys, d[keys].value);
					}else if(d[keys].action == "b"){
						b(keys, d[keys].value);
					}else if(d[keys].action == "value"){
						value(keys, d[keys].value);
					}

        	}                    	
        }
		}
	});
}

function v(keys, value){
	
	if(value == true){
		$("."+keys).css("background-color","green");
		$("."+keys).css("color","white");
	}else{
		$("."+keys).css("background-color","#E3E3E3");
		$("."+keys).css("color","black");
	}

}
/*
function c(keys, value){
//	$("."+keys).text(value);
	
	if(value == true){
		$("."+keys).css("background-color","red");
		$("."+keys).css("color","white");
	}else{
		$("."+keys).css("background-color","green");
		$("."+keys).css("color","black");
	}
	
}
*/
function value(keys, value) {
    var finalValue;
    
    if (keys === "D11101" || keys === "D11102") {
        finalValue = ((value / 100).toFixed(2) + " mm");
    } else if (keys === "D11105") {
    	finalValue = ((value * 0.1).toFixed(1) + " kN");
    } else {
        finalValue = (value + " kN");
    }

    $("." + keys).text(finalValue);
    $("." + keys).css({
        "text-align": "center",
        "font-size": "16pt"
    });
}



</script>  
 
</body>
</html>