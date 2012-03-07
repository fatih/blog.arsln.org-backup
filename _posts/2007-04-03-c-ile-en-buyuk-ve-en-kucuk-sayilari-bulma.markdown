---
date: '2007-04-03 16:44:26'
layout: post
slug: c-ile-en-buyuk-ve-en-kucuk-sayilari-bulma
status: publish
title: C ile en büyük ve en küçük sayıları bulma
wordpress_id: '210'
categories:
- Programlama
tags:
- c
- code
- kod
- largest
- Programlama
- smallest
---

Kod'u çalıştırdıktan sonra, sayılar girmenizi isteyecek, sonra da en büyük ve en küçük sayıyı size gösterecek. İnternet'de çok araştırmıştım fakat bir çözüme ulaşamamıştım. "**Largest Smallest Number C Programming"** diye aratınca da pek bir şey bulamadım. Başkaları arayınca burayı bulsunlar diye yazdım kelimeleri :) En son çare'yi Freenode'a ##c kanalında buldum. Pragma takma adlı bir kişi bir iki yerde yardım etti bana. Buraya yazdıklarımı bilmezse dahi, kendisine teşekkür ederim. 


    
    #include <stdio.h>
    #define Sentinel 0
    
    int largest(int max, int a);
    int smallest(int min,int b);
    
    int main(void)
    {	
    	int maximum,minimum,num;	
    
    	printf("\nInput the number(Enter %d for exit): ", Sentinel); 	scanf("%d", &num;);
    
    	maximum = num;
    	minimum = num;
    	
    	while (num != Sentinel) {
    		maximum = largest(maximum,num);
    		minimum	= smallest(minimum,num);
    		printf("Input the number(Enter %d for exit): ",Sentinel); 	scanf("%d", &num;);
    	}
    
    	printf("\nLargest number: %d\n", maximum); 
    	printf("Smallest number: %d\n\n", minimum); 
    
    	return (0);
    }
    
    //Get numbers and compare, return the largest
    int largest(int max, int a)
    {
    	if ( max < a)	{	
    		return (a);
    	}
    	else 	{
    		return (max);
    	}
    }
    
    //Get numbers and compare, return the smallest
    int smallest(int min,int b)
    {
    	if ( min > b)		{
    		return (b);
    	}
    	else {
    		return (min);
    	}
    }



_Not:(Çok basit olduğunu bliliyorum fakat bulamamıştım belki başkaların işine yarar)_
_Not 2: Programlama adında yeni bir kategori açtım._
