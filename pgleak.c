#include "postgres.h"
#include "fmgr.h"
#include "utils/memutils.h"

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(pgleak_leak_sum);
Datum
pgleak_leak_sum(PG_FUNCTION_ARGS)
{
  MemoryContext oldctx = MemoryContextSwitchTo(TopMemoryContext);
  int a = DatumGetInt32(PG_GETARG_DATUM(0));
  int b = DatumGetInt32(PG_GETARG_DATUM(1));
  int *sum = palloc(sizeof(int));
  *sum = a + b;
  MemoryContextSwitchTo(oldctx);
  return Int32GetDatum(*sum);
}

PG_FUNCTION_INFO_V1(pgleak_leak_sum_malloc);
Datum
pgleak_leak_sum_malloc(PG_FUNCTION_ARGS)
{
  int a = DatumGetInt32(PG_GETARG_DATUM(0));
  int b = DatumGetInt32(PG_GETARG_DATUM(1));
  int *sum = malloc(sizeof(int));
  *sum = a + b;
  return Int32GetDatum(*sum);
}
