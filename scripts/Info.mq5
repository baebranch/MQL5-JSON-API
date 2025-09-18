//+------------------------------------------------------------------+
//|                                                         Test.mq5 |
//|                                                     Brian Branch |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Brian Branch"
#property link      ""
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
input int shift=0;

//---CJAVal lastVol;

void OnStart()
  {
//---
    Print("_______________________________________________");
    //--- Broker and Account  info
    Print("The name of the broker = ",AccountInfoString(ACCOUNT_COMPANY));
    Print("Deposit currency = ",AccountInfoString(ACCOUNT_CURRENCY));
    Print("Client name = ",AccountInfoString(ACCOUNT_NAME));
    Print("The name of the trade server = ",AccountInfoString(ACCOUNT_SERVER));

    //--- Chart info
    Print("Symbol: ", Symbol());
    Print("Time: ", TimeCurrent());
    Print("Local Time: ", TimeLocal());          // local time of the terminal
    Print("Last Known Server Time: ", TimeCurrent());        // last known server time
    Print("Estimated Server Time: ", TimeTradeServer());    // estimated server time
    Print("GMT Time: ", TimeGMT());            // GMT time (calculation from local via time zone shift)
    Print("Time Zone Offset: ", TimeGMTOffset());      // time zone shift compare to GMT, in seconds
    Print("Daylight Savings Correction: ", TimeDaylightSavings());// correction for summer time in seconds
    Print("Chart Period: ", EnumToString(Period()));
    Print("Account Leverage: ", AccountInfoInteger(ACCOUNT_LEVERAGE));
    Print("Account Margin: ", AccountInfoDouble(ACCOUNT_MARGIN));
    Print("Free Margin: ", AccountInfoDouble(ACCOUNT_MARGIN_FREE));
      
    datetime time  = iTime(Symbol(),Period(),shift);
    double   open  = iOpen(Symbol(),Period(),shift);
    double   high  = iHigh(Symbol(),Period(),shift);
    double   low   = iLow(Symbol(),Period(),shift);
    double   close = iClose(NULL,PERIOD_CURRENT,shift);
    long     volume= iVolume(Symbol(),0,shift);
    int      bars  = iBars(NULL,0);
    int      spread = iSpread(Symbol(), Period(), shift);

    Print(long(time)," | ", open," | ",high," | ",low," | ",close," | ",volume," | ",spread," | ",GetTickCount()," | ",iTickVolume(Symbol(),Period(),0));
    double delta = (double) iTickVolume(Symbol(),Period(),0) - iVolume(Symbol(),0,shift);
    Print(time);
    //Print("Delta: ", delta);
    //lastVol[Symbol()] = (double) iTickVolume(Symbol(),Period(),0);
    //Print(lastVol[Symbol()]);
    Print("Minimum volume: ", SymbolInfoDouble(Symbol(), SYMBOL_VOLUME_MIN));
    Print("Margin Value: ", SymbolInfoDouble(Symbol(), SYMBOL_MARGIN_HEDGED));
    Print("Symbol Initial Margin Value: ", SymbolInfoDouble(Symbol(), SYMBOL_MARGIN_INITIAL));
    Print("Tick Value: ", SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE_PROFIT));
    Print("Tick size: ", SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_SIZE));
    Print("Lot Size: ", SymbolInfoDouble(Symbol(), SYMBOL_TRADE_CONTRACT_SIZE));
    Print("_______________________________________________");
  }
//+------------------------------------------------------------------+
