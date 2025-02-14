---
title: "Inspect pattern"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Inspect pattern
> [!Definition]
> We use inspect pattern to make [Debugging](Debugging) [Pipe pattern](Pipe%20pattern.md) easy.

## Code
Very basic program that prints consecutive variables to console.
```js
const inspect = (tag) => (x) => {  
	console.log(`${tag}: ${x}`)  
	return x  
}
```

## Motivation
Using pipe pattern is really nice but debugging it may be troublesome. Often, to debug code you have to break down the pipe into separate function calls. This defeats use of pipe all-together. However, use of inspect pattern can make it easy. Example provided [here](https://blog.bitsrc.io/functional-programming-composition-2e9b863d8bcb) but copied for easy, offline access:

Say you have piped function like this:
```js
const priceCalculator = (  
  taxPercentage = 0.3,   
  serviceFees = 10,   
  price,   
  discount,   
  percentCoupon,   
  valueCoupon,  
  weight,   
  $PerKg  
) => {  
  const applyTax           = (val) => val * (1 + taxPercentage)  
  const applyServiceFees   = (val) => val + serviceFees  
  const applyPercentCoupon = (val) => val - val * percentCoupon  
  const applyValueCoupon   = (val) => val - valueCoupon  
  const applyDiscount      = (val) => val - discount  
  const applyShippingCost  = (val) => val + weight * $PerKg
  return pipe(  
    applyPercentCoupon,  
    applyDiscount,  
    applyValueCoupon,  
    applyShippingCost,  
    applyServiceFees,  
    applyTax  
  )(price)
}
```
Basically, just some easy calculations of a price split into [pure functions](Pure%20function.md) and piped together.

Using the code defined in Code section we get:

```js
const priceCalculator = (
  taxPercentage = 0.3, 
  serviceFees = 10, 
  price, 
  discount, 
  percentCoupon, 
  valueCoupon,
  weight, 
  $PerKg
) => {
  const applyTax           = (val) => val * (1 + taxPercentage)
  const applyServiceFees   = (val) => val + serviceFees
  const applyPercentCoupon = (val) => val - val * percentCoupon
  const applyValueCoupon     = (val) => val - valueCoupon
  const applyDiscount        = (val) => val - discount
  const applyShippingCost    = (val) => val + weight * $PerKg
return pipe(
    inspect('price'),
    applyPercentCoupon,
    inspect('after applyPercentCoupon'),
    applyDiscount,
    inspect('after applyDiscount'),
    applyValueCoupon,
    inspect('after applyValueCoupon'),
    applyShippingCost,
    inspect('after applyShippingCost'),
    applyServiceFees,
    inspect('after applyServiceFees'),
    applyTax
  )(price)
}
```
This way each call to inspect creates a function that is instantly fed some data from next function call. Then, we can easily debug why the code does not work (this is left as exercise for the reader).
