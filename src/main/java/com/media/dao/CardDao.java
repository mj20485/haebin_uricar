package com.media.dao;

import java.util.List;
import java.util.Map;

import com.media.dto.CardDto;

public interface CardDao {

   public void cardInsert(CardDto card);

   public CardDto getCardInfo(CardDto card);

   public List<CardDto> getCardList(String mid);

}