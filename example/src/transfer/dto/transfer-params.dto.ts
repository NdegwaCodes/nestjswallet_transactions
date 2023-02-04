
import { ApiModelProperty } from '@nestjs/swagger/dist/decorators/api-model-property.decorator';

export class TransferParamsDTO {


  @ApiModelProperty({
    default: 200,
  })
  sum!: number;

  @ApiModelProperty({
    default: 1,
  })
  userIdFrom!: number;

  @ApiModelProperty({
    default: 2,
  })
  userIdTo!: number;

  @ApiModelProperty({
    default: false,
  })
  withError!: boolean;

  static new({ sum, userIdTo, userIdFrom, withError }: TransferParamsDTO) {
    const it = new TransferParamsDTO();
    it.sum = sum;
    it.userIdTo = userIdTo;
    it.userIdFrom = userIdFrom;
    it.withError = withError;
    return it;
  }
}